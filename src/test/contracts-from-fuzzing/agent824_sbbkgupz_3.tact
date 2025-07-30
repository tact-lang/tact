struct OptionalFields {
    name: String = "";
    age: Int?;
    isMember: Bool = false;
    nickname: String?;
}

contract TestContract {
    user: OptionalFields;

    init() {
        self.user = OptionalFields{
            age: null,
            nickname: null,
        };
    }
}
