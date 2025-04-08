struct Mid1 {
    x: Int;
}

struct Mid2 {
    middle: Mid1;
}

struct Outer2 {
    in1: Mid2;
    in2: Int;
    in3: Bool;
    in4: Bool?;

}

contract NestedMix {
    param: Outer2;

    init() {
        self.param = Outer2{
            in1: Mid2{ middle: Mid1{ x: 77 } },
            in2: 99,
            in3: true,
            in4: null,
        };
    }
}