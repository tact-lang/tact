struct Inner1 { val1: Int; }
struct Inner2 { val2: Int; }
struct Inner3 { val3: Int; }
struct ComboNest {
    a: Inner1?;
    b: Inner2?;
    c: Inner3?;
}

contract OptionalMix {
    combo: ComboNest;

    init() {
        self.combo = ComboNest{
            a: Inner1{val1:1},
            b: null,
            c: Inner3{val3:3}
        };
    }
}