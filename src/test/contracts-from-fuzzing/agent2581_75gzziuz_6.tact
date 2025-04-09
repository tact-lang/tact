struct Inner {
    a: Int;
    b: Bool;
}

struct OuterOptional {
    nestedOpt: Inner?;
    flag: Bool;
}

contract NestedOptionalStruct {
    val: OuterOptional;

    init() {
        self.val = OuterOptional{
            nestedOpt: null,
            flag: false
        };
    }
}
