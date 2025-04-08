struct NestedSer {
    x: Int as uint16;
    y: Int as int16;
}

contract NestedSerContract {
    s: NestedSer;
    init() {
        self.s = NestedSer{ x: 123, y: -123 };
    }
}