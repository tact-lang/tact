struct NestedA {
    val: Int;
    next: NestedB;
}

struct NestedB {
    flag: Bool;
    opt: NestedC?;
}

struct NestedC {
    big: Int;
    small: Int;
}

contract TestNestedStruct {
    s: NestedA;

    init() {
        self.s = NestedA{
            val: 99,
            next: NestedB{
                flag: true,
                opt: NestedC{big: 1000, small: 1}
            }
        };
    }
}