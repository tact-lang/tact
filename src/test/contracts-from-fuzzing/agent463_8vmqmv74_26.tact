struct Flags {
    admin: Bool;
    member: Bool;
    verified: Bool;
    banned: Bool;
    muted: Bool;
}

contract FlagsCont {
    perms: Flags;

    init() {
        self.perms = Flags{
            admin: false,
            member: true,
            verified: false,
            banned: false,
            muted: true
        };
    }
}