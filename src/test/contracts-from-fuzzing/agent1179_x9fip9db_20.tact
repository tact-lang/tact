struct X {
    one: Int;
    two: String?;
    three: Bool;
    four: Int?;
}

contract Combo {
    f: X;

    init() {
        self.f = X{
            one: 1,
            two: null,
            three: true,
            four: null
        };
    }

    receive() {}
}