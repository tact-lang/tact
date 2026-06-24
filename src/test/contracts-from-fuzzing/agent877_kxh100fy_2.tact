struct Nested {
    n1: Int;
    n2: Bool;
    n3: String;
}

contract TestNested {
    myField: Nested;

    init() {
        self.myField = Nested{
            n1: 5,
            n2: true,
            n3: "abc",
        };
    }
}