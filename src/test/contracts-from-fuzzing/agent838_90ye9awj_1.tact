struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    val: NestedOptional;
    
    init() {
        self.val = NestedOptional{ x: null, y: true };
    }
}