struct DeepNest1 {
    a: Int;
    next: DeepNest2;
}

struct DeepNest2 {
    b: Bool;
    next: DeepNest3;
}

struct DeepNest3 {
    c: String;
    next: DeepNest4;
}

struct DeepNest4 {
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            a: 1,
            next: DeepNest2{
                b: true,
                next: DeepNest3{
                    c: "nest",
                    next: DeepNest4{
                        d: null,
                        e: false,
                        f: null,
                    }
                }
            }
        };
    }
}