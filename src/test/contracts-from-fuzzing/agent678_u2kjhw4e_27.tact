struct Profile {
    userId: Int;
    nickname: String?;
}

contract TestParam(
    profile: Profile,
    enabled: Bool,
    info: String?
) {
    receive() {
        // Just dummy receive referencing fields
        if (self.enabled) {
            dump(self.profile.userId);
            dump(self.info);
        }
    }
}