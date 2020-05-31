#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <notify.h>

#define SettingsChangedNotification "com.subdiox.slicespreferences/settingsChanged"
#define UserSettingsFile @"/var/mobile/Library/Preferences/com.subdiox.slicespreferences.plist"
#define isEnabledToggle @"isEnabled"

@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface FlipswitchForSlices3Switch : NSObject <FSSwitchDataSource>
@end

@implementation FlipswitchForSlices3Switch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSNumber *isEnabledToggleState = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:isEnabledToggle inDomain:UserSettingsFile];
	BOOL enabled = (isEnabledToggleState) ? [isEnabledToggleState boolValue]:YES;
	return (enabled) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		[[NSUserDefaults standardUserDefaults] setObject:@YES forKey:isEnabledToggle inDomain:UserSettingsFile];
		[[NSUserDefaults standardUserDefaults] synchronize];
		break;
	case FSSwitchStateOff:
		[[NSUserDefaults standardUserDefaults] setObject:@NO forKey:isEnabledToggle inDomain:UserSettingsFile];
		[[NSUserDefaults standardUserDefaults] synchronize];
		break;
	}
	notify_post(SettingsChangedNotification);
}

@end
