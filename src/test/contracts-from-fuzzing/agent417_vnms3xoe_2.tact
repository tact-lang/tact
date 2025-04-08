struct NestedInner {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    nested: NestedInner;
    c: Bool;
}

contract TestContract {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            nested: NestedInner{
                a: 5,
                b: false,
            },
            c: true,
        };
    }
}