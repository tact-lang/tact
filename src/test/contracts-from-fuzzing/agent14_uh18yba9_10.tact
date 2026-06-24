struct Depth3 { q: Int?; }
struct Depth2 { d3: Depth3?; }
struct Depth1 { d2: Depth2?; }

contract MultiLevelOptionals {
    nested: Depth1;

    init() {
        self.nested = Depth1{ d2: null };
    }
}