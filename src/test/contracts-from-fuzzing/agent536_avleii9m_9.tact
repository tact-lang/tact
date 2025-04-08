struct Profile {
    name: String = "Anon";
    age: Int?; // defaults to null implicitly
}

contract OptionalStructField {
    user: Profile = Profile{name: "John"};

    init() {
        self.user = Profile{name: "Alice", age: 30};
    }
}