struct Contained {
    str: String;
    flag: Bool;
    amount: Int;
}

contract MultiOption {
    a: Contained?;
    b: Contained?;

    init() {
        self.a = Contained{ str: "foo", flag: true, amount: 10 };
        self.b = null;
    }
}