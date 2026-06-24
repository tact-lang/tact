struct DeepNest3 {
    d: Int;
}

struct DeepNest2 {
    c: DeepNest3;
    s: String;
}

struct DeepNest1 {
    b: DeepNest2;
    flag: Bool;
}

contract DeepNested {
    state: DeepNest1;
    init() {
        self.state = DeepNest1{
            b: DeepNest2{
                c: DeepNest3{
                    d: 10
                },
                s: "test"
            },
            flag: true,
        };
    }
}