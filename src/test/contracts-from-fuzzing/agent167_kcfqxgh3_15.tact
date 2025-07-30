struct Embed {
    a: Int = 7;
    b: String = "x";
}

contract DoubleOptional {
    opt1: Embed?;
    opt2: Embed?;

    init() {
        self.opt1 = Embed{a: 1, b: "a"};
        self.opt2 = Embed{a: 2, b: "b"};
    }
}