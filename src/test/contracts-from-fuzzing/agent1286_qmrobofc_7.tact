struct OptionalNested {
    b: Bool;
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract OptionalDeep {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ b:true, innerOpt: null };
    }
}