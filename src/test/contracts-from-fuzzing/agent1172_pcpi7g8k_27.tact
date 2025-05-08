struct PrimitiveNest {
    str: String;
    i: Int;
}

struct Holder {
    s: PrimitiveNest;
    b: Bool;
}

contract CombineTest {
    f: Holder;

    init() {
        self.f = Holder{
            s: PrimitiveNest{ str: "hi", i:42 },
            b: true
        };
    }
}