struct One {
    val: Int as uint8;
}

struct Two {
    val: Int as int4;
}

struct Three {
    val: Int as coins;
}

contract SerializationVariants {
    s1: One;
    s2: Two;
    s3: Three;

    init() {
        self.s1 = One{ val: 255 };
        self.s2 = Two{ val: 7 };
        self.s3 = Three{ val: 1000 };
    }
}
