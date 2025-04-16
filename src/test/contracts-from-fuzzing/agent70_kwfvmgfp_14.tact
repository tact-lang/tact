struct PartialDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hello";
    d: Int;
}

contract TestContract {
    p: PartialDefaults;

    init() {
        self.p = PartialDefaults{ a: 7, b: true, c: "hi", d: 9 };
    }

    receive() {
        self.p = PartialDefaults{ a: 1, b: false, c: "bye", d: 2 };
    }
}