struct NestedBool {
    a: Bool;
    s: InnerBools;
}

struct InnerBools {
    x: Bool;
    y: Bool;
}

contract DeepBools {
    val: NestedBool;
    init() {
        self.val = NestedBool{ a:true, s: InnerBools{ x:false, y:true } };
    }
}