struct X {
    a: Int;
    b: Bool;
    c: String;
}

contract OptStructInit {
    x: X?;

    init() {
        self.x = X{ a:1, b:true, c:"hi" };
    }
}