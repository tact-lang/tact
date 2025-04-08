struct Left {
    a: Int;
    b: Bool?;
}
struct Right {
    x: Left;
    y: Int?;
}
contract TestContract {
    l: Left;
    r: Right;
    init() {
        self.l = Left{ a:1, b:null };
        self.r = Right{ x: self.l, y:null };
    }
}