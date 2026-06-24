struct Compose {
    a: Int;
    o1: Inner?;
}

struct Inner {
    s: String;
    o2: Int?;
}

contract Test {
    comp: Compose;

    init() {
        self.comp = Compose{
            a: 1,
            o1: Inner{
                s: "x",
                o2: null
            }
        };
    }
}