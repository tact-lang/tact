struct NestedMix {
    a: Bool;
    b: Inner1;
}

struct Inner1 {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    flag: Bool?;
    z: String;
}

contract TestContract {
    m: NestedMix;
    init() {
        self.m = NestedMix{
            a: false,
            b: Inner1{
                x: 10,
                y: Inner2{ flag: null, z: "abc" }
            }
        };
    }
}