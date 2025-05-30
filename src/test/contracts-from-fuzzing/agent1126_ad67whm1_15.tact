struct NestedWider {
    inner1: Int;
    inner2: Int as int128;
    inner3: Int as uint8;
    inner4: Bool;
    inner5: Bool?;
}

contract SerializeNestedWider {
    state: NestedWider;
    init() {
        self.state = NestedWider{
            inner1: 1000,
            inner2: -100,
            inner3: 250,
            inner4: true,
            inner5: null
        };
    }
}