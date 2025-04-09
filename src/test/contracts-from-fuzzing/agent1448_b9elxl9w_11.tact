struct NestedOption {
    x: Int?;
}

contract UninitOpt {
    val: NestedOption;
    
    init() {
        self.val = NestedOption{ x: null };
    }
}