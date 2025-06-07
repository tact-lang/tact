struct InnerA {
    i: Int;
}

struct InnerB {
    flag: Bool;
    nested: InnerA;
}

contract NestedStructs {
    val: InnerB;

    init() {
        self.val = InnerB{ flag:true, nested: InnerA{i:42} };
    }
}