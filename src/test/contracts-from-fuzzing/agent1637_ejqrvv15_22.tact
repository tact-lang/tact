struct ManyOptionNested {
    a: Int?;
    b: Inner?;
    c: String?;
}

struct Inner {
    flag: Bool?;
    val: Int?;
}

contract MixOptionNest {
    test: ManyOptionNested;

    init() {
        self.test = ManyOptionNested{
            a: 1,
            b: Inner{
                flag: true,
                val: null
            },
            c: null
        };
    }
}