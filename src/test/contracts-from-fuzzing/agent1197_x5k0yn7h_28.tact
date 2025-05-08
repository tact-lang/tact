struct BoolStringInt {
    a: Bool;
    b: String;
    c: Int;
}

contract TestContract {
    x: BoolStringInt;
    init() {
        self.x = BoolStringInt{ a:true, b:"hi", c:123 };
    }
}