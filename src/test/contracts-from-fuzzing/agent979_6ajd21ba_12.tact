struct NestedOptional {
    optInner: Inner?;
}

struct Inner {
    optInt: Int?;
    someBool: Bool;
}

contract Test {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            optInner: Inner{
                optInt: null,
                someBool: true
            }
        };
    }
}