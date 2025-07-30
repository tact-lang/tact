struct S {
    a: Int;
    b: Int = 5;
    c: Bool?;
    d: String = "default";
}

contract Defaults {
    s: S;

    init() {
        self.s = S{
            a: 1,
            // omit b,d and c to test default and null
        };
    }
}