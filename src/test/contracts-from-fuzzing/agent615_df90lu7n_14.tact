struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Mid {
    im: InnerMost?;
    val: String;
}

struct OuterMost {
    m: Mid;
    flag: Bool?;
}

contract ComplexPersist {
    data: OuterMost = OuterMost{
        m: Mid{
            im: null,
            val: "test"
        },
        flag: null
    };

    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}