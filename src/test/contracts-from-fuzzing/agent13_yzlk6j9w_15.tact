struct OptNested {
    x: Int?;
    y: Bool?;
}

contract NestedChainOptional {
    a: OptNested?;
    b: OptNested?;
    c: OptNested?;
    
    init() {
        self.a = null;
        self.b = OptNested{ x: 12, y: null };
        self.c = null;
    }
}