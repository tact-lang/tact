struct Reversed {
    s: String;
    b: Bool;
    i: Int;
}

contract ReverseOrder {
    r: Reversed;
    init() {
        self.r = Reversed{ s:"x", b:true, i:42 };
    }
}