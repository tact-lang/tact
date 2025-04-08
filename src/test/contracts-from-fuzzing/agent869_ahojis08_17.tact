struct Sub1 { k1: Int; k2: Bool; }
struct Sub2 { p1: String; p2: Bool?; }
struct Contain {
    s1: Sub1;
    s2: Sub2;
    opt: Sub1?;
}

contract TestContract {
    val: Contain;

    init() {
        self.val = Contain{
            s1: Sub1{
                k1: 1,
                k2: false
            },
            s2: Sub2{
                p1: "hello",
                p2: null
            },
            opt: null
        };
    }
}