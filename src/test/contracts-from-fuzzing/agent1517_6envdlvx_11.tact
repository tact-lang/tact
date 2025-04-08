struct Profile { name: String; age: Int; }

contract OptStructNonNull {
    info: Profile?;
    init() {
        self.info = Profile{ name: "Vitalik", age: 29 };
    }
}