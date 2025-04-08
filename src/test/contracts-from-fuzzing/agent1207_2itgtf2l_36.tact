struct Test {
    a: Int?; 
    b: String?; 
    c: Bool?;
}

contract DefaultsThenOverride {
    val: Test = Test{ a:null, b:null, c:null };

    init() {
        self.val = Test{ a:1, b:"hi", c:true };
    }
}