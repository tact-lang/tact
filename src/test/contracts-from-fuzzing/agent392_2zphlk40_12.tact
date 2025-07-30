struct Container {
    a: Int;
    b: Sub1;
    c: Sub2;
}

struct Sub1 {
    x: Int;
    y: Bool;
}

struct Sub2 {
    m: String;
    n: Bool?;
}

contract ComplexEmbedded {
    val: Container;

    init() {
        self.val = Container{
            a: 1,
            b: Sub1{
                x: 2,
                y: false
            },
            c: Sub2{
                m: "hi",
                n: null
            }
        };
    }
}
