struct Inner1 { v1: Int; v2: String }
struct Inner2 { v3: Bool; v4: String }
struct Outer {
    in1: Inner1;
    in2: Inner2;
    count: Int;
}

contract Combo {
    opt: Outer;

    init() {
        self.opt = Outer{
            in1: Inner1{ v1: 42, v2: "foo" },
            in2: Inner2{ v3: true, v4: "bar" },
            count: 77
        };
    }
}