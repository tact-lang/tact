struct Profile {
    name: String;
    age: Int as uint8;
    active: Bool;
}

contract OptionalStruct {
    user: Profile? = null;

    init() {
        self.user = Profile{ name: "Alice", age: 30, active: true };
    }
}