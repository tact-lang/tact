struct Alpha {
    one: Int;
    two: Bool;
    three: String;
}

contract ManyTypes {
    a: Alpha;
    init() {
        self.a = Alpha{ one: 42, two: true, three: "hello" };
    }
}