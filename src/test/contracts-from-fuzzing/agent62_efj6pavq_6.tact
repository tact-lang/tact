struct ArrayLike {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
}

contract MultiInts {
    storage: ArrayLike;

    init() {
        self.storage = ArrayLike{
            v1:1, v2:2, v3:3, v4:4, v5:5
        };
    }
}
