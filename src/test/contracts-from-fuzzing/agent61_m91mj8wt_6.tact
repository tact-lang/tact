struct MapNested {
    m: map<Int, Nested>;
}

struct Nested {
    val: Int;
}

contract Test {
    data: MapNested;
    init() {
        self.data = MapNested{ m: emptyMap() };
    }
}