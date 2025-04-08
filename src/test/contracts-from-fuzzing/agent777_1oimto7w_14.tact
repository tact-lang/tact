struct Flat {
    a: Int;
    b: String;
    c: Bool;
}

contract MultipleTypesStorage {
    f: Flat;

    init() {
        self.f = Flat{ a: 100, b: "hello", c: true };
    }
}