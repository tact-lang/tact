struct Strs {
    a: String = "";
    b: String = "";
    c: String = "";
}

contract ManyEmptyStrings {
    s: Strs;

    init() {
        self.s = Strs{ a: "A", b: "", c: "C" };
    }

    receive() {
        let _ = self.s;
    }
}