struct DefaultInMiddle {
    a: Int;
    b: String = "x";
    c: Bool;
}

contract TestContract {
    s: DefaultInMiddle;

    init() {
        self.s = DefaultInMiddle{ a:1, c:true };
    }
}