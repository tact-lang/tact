struct Complex {
    n1: Int;
    n2: Int;
    flag: Bool;
    t: String?;
    alive: Bool;
    s: String;
}

contract ManyOptionalVars {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Complex;

    init() {
        self.a = null;
        self.b = "hi";
        self.c = true;
        self.d = Complex{
            n1: 1,
            n2: 2,
            flag: false,
            t: null,
            alive: true,
            s: "test"
        };
    }
}