message(0x42) Person {
    name: String;
    age: Int;
}

contract OptionalMessageVar {
    p: Person?;

    init() {
        self.p = null;
    }
}