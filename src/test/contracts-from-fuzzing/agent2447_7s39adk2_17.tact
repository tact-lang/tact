struct S1 { val: Int; }
struct S2 { val: Int; }

struct BigOpt {
    a: S1?;
    b: S2?;
}

contract ManyNestedOpt {
    f: BigOpt = BigOpt{
        a: S1{ val: 1 },
        b: null
    };
}