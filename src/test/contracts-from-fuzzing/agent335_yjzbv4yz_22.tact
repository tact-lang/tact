struct X { a: Int; b: Bool; c: Int?; d: Bool? }

contract ManyInstanceAssigns {
    val1: X;
    val2: X;

    init() {
        self.val1 = X{ a:1, b:true, c:null, d:false };
        self.val2 = X{ a:2, b:false, c:3, d:null };
    }
}
