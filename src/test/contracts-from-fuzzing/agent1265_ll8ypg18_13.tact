struct DeepMix {
    inner: Inner1;
    opt: Inner2?;
}

struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Int?;
}

contract Combo {
    data: DeepMix;
    init() {
        self.data = DeepMix{
            inner: Inner1{ a:1, b:true },
            opt: Inner2{ c:"str", d:null },
        };
    }
}