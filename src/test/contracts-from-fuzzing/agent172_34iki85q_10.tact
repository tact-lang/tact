struct Profile {
    handle: String;
    verified: Bool?;
    bio: String?;
}

struct User {
    uid: Int as uint64;
    profile: Profile?;
}

struct Root {
    admin: User?;
    guest: User?;
}

contract NestedOptionalStructs {
    rootData: Root;

    init() {
        self.rootData = Root {
            admin: User {
                uid: 100,
                profile: Profile {
                    handle: "adminUser",
                    verified: true,
                    bio: "The administrator",
                }
            },
            guest: null,
        };
    }
}