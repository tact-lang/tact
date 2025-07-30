struct S { x:Int }

contract CrossInit {
    a: Int;
    b: S;
    
    init() {
        self.a = 10;
        self.b = S{ x: self.a };
    }
}