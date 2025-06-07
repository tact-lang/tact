struct S1 { a: Int }

struct S2 {
    b: Int;
    nested: S1;
    flag: Bool;
    text: String;
}

contract TestContract {
    s2: S2;

    init() {
        self.s2 = S2{
            b: 1,
            nested: S1{ a: 2 },
            flag: true,
            text: "hello"
        };
    }
}