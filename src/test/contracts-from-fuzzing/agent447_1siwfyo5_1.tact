struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    p1: Int;
    p2: Bool?;
    p3: String;
    p4: Nested;
    p5: Nested?;
    
    init() {
        self.p1 = 1;
        self.p2 = true;
        self.p3 = "test";
        self.p4 = Nested{ x: 1, y: 2 };
        self.p5 = Nested{ x: 3, y: null };
    }
}