struct Test {
    a: Int;
    b: String;
    c: Bool?;
}

contract DefaultsInStruct {
    t: Test;

    init() {
        self.t = Test{ a: 5, b: "x", c: null };
    }
}