struct Details {
    name: String;
    age: Int?;
    active: Bool;
}

contract UserData {
    info: Details;

    init() {
        self.info = Details{ name: "tester", age: null, active: true };
    }
}