struct DeepNest3 {
    a: Int;
    b: DeepNest2;
}

struct DeepNest2 {
    x: Bool;
    y: DeepNest1;
}

struct DeepNest1 {
    m: String;
    n: Bool;
}

contract SuperDeep {
    store: DeepNest3;

    init() {
        self.store = DeepNest3{
            a: 42,
            b: DeepNest2{
                x: true,
                y: DeepNest1{
                    m: "deep inside",
                    n: false
                }
            }
        };
    }
}
