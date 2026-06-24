struct A {
    one: Int;
    two: String;
    three: Bool;
    four: Int?;
    five: String;
    six: Bool?;
    seven: Int;
    eight: String;
    nine: Bool?;
    ten: String;
}

contract LargeNested {
    store: A;

    init() {
        self.store = A{
            one: 1,
            two: "two",
            three: true,
            four: null,
            five: "five",
            six: false,
            seven: 7,
            eight: "eight",
            nine: true,
            ten: "ten"
        };
    }
}