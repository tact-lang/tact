struct ContactInfo {
    email: String?;
    phone: String?;
}

struct MetaData {
    twitter: String?;
    github: String?;
}

struct User {
    contact: ContactInfo?;
    meta: MetaData?;
}

contract TestContract {
    profile: User;

    init() {
        self.profile = User{
            contact: null,
            meta: null,
        };
    }

    receive() {
        let c = self.profile.contact;
        let m = self.profile.meta;
    }
}