struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedOptional {
    val: Combo;

    init() {
        self.val = Combo{
            a: 42, b: true, c: null, d: false, e: "test", f: "opt"
        };
    }
}