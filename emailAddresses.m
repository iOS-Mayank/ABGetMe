// Application must link with the MessageUI framework
- (NSArray *) emailAddresses
{
	NSMutableArray *emailAddresses = [NSMutableArray array];
	@try
	{
		Class MailComposeController = NSClassFromString(@"MailComposeController");
		NSArray *accountEmailAddresses = [MailComposeController performSelector:@selector(accountEmailAddresses)];
		for (id address in accountEmailAddresses)
		{
			if ([address isKindOfClass:[NSString class]])
				[emailAddresses addObject:address];
		}
	}
	@catch (NSException *e) {}
	
	return [NSArray arrayWithArray:emailAddresses];
}