// optional Int and Bool fields inside nested optional struct
struct Profile {
    name: String;
    age: Int?;
    verified: Bool?;
}

contract Test {
    profile: Profile?;

    init() {
        self.profile = null;
    }
}