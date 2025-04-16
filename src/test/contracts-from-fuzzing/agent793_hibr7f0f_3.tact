struct Deep {
    val: Int;
    optSub: Sub?;
}

struct Sub {
    subval: Int;
    name: String?;
}

contract DeepOptional {
    d: Deep;
    init() {
        self.d = Deep{
            val: 42,
            optSub: null,
        };
    }
}