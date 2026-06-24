struct NestedInner2 {
    val1: Int;
}

struct Middle2 {
    inner: NestedInner2;
}

struct Outer2 {
    mid: Middle2;
}

contract DeepInitDefaults {
    val: Outer2;

    init() {
        self.val = Outer2{
            mid: Middle2{
                inner: NestedInner2{
                    val1: 42
                }
            }
        };
    }
}