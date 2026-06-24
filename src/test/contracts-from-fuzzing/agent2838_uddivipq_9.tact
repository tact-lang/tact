struct Inner1 { val1: Int; }
struct Inner2 { val2: Bool?; }
struct Middle {
    in1: Inner1;
    in2: Inner2;
    s: String;
}
contract StructMix {
    s: Middle;

    init() {
        self.s = Middle{
            in1: Inner1{ val1: 77 },
            in2: Inner2{ val2: null },
            s: "hello"
        };
    }
}