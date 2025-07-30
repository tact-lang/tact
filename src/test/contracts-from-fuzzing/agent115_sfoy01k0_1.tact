struct Nested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

contract TestContract {
    simpleInt: Int;
    simpleBool: Bool;
    simpleString: String;
    nested: Nested;

    init() {
        self.simpleInt = 1;
        self.simpleBool = true;
        self.simpleString = "abc";
        self.nested = Nested{inner1: 2, inner2: false, inner3: "def"};
    }
}
