// optional of nested optional
struct Inner {
    b: Bool?;
}

contract NestedBothOpt {
    val: Inner?;

    init() {
        self.val = Inner{b:true};
    }
}
