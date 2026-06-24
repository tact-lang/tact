struct NestedSerialize {
    tiny: Int as uint4;
    middle: Int as uint16;
}

contract NestedSer {
    data: NestedSerialize;

    init() {
        self.data = NestedSerialize{ tiny: 15, middle: 65535 };
    }
}