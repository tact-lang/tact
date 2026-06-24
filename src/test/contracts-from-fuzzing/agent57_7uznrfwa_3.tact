struct NestedOptional {
    a: Int;
    b: Bool?;
    c: String?;
}

contract UseNestedOpt {
    val: NestedOptional;
    
    init() {
        self.val = NestedOptional{ a: 10, b: null, c: null };
    }
}