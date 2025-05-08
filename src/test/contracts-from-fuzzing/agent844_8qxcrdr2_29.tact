struct First {
    a: Int;
    b: Bool;
}

struct Second {
    c: String;
    d: Int?;
}

contract ManyNestedStructs {
    f: First;
    s: Second;
    x: Int;

    init() {
        self.f = First{a:100, b:true};
        self.s = Second{c:"str", d:null};
        self.x = 42;
    }

    receive() {
        let _ = self.f;
        let _ = self.s;
        let _ = self.x;
    }
}
