struct InnerArrayLike {
    v0: Int;
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
}

contract ManyPacked {
    s1: InnerArrayLike;
    s2: InnerArrayLike;

    init() {
        self.s1 = InnerArrayLike{ v0:1,v1:2,v2:3,v3:4,v4:5 };
        self.s2 = InnerArrayLike{ v0:6,v1:7,v2:8,v3:9,v4:10 };
    }
}