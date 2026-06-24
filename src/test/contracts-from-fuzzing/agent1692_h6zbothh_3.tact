struct Details {
    nickname: String?;
    age: Int?;
    verified: Bool?;
}

contract OptionalNestedStructTest {
    profile: Details;

    init() {
        self.profile = Details{
            nickname: null,
            age: null,
            verified: null
        };
    }
}