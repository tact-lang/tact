struct OptNested {
    deep: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOptNested {
    s: OptNested;

    init() {
        self.s = OptNested{
            deep: Inner{
                a: null,
                b: null,
                c: null
            }
        };
    }
}
