struct S1 {
    val: Int;
    opt: Int?;
}

struct S2 {
    foo: Bool;
    nested: S1;
}

contract ManyNestedOpt {
    data: S2;

    init() {
        self.data = S2{
            foo: true,
            nested: S1{ val: 7, opt: null }
        };
    }
}