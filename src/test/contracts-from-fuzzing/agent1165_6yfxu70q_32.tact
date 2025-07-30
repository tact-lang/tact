struct NestedBothOpt {
    a: Int?;
    b: Bool?;
}

contract OptStructCombine {
    val: NestedBothOpt?;
    
    init() {
        self.val = null;
    }
}
