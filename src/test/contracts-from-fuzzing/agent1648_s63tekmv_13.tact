struct BoolOptional {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract TestContract {
    val: BoolOptional;
    
    init() {
        self.val = BoolOptional{
            a: null,
            b: true,
            c: false
        };
    }
}