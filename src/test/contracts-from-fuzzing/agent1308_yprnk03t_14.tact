struct User {
    id: Int as uint64;
    name: String?;
    admin: Bool;
}

struct Session {
    user: User?;
    token: String;
    valid: Bool?;
}

contract TestContract {
    sess: Session;

    init() {
        self.sess = Session {
            user: null,
            token: "",
            valid: null
        };
    }
}