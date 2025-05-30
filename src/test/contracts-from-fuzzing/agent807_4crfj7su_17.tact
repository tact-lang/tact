// contract persistent storage with mix of primitive and deeply nested structs and optionals
struct Leaf {
    x: Int;
    y: Bool;
}

struct MidLevel {
    leafA: Leaf;
    leafB: Leaf?;
}

struct Root {
    mid: MidLevel;
    label: String;
}

contract DeepMix {
    core: Root;
    flag: Bool?;
    count: Int;
    note: String?;

    init() {
        self.core = Root{
            mid: MidLevel{
                leafA: Leaf{ x:1, y:true },
                leafB: null
            },
            label: "deep",
        };
        self.flag = null;
        self.count = 7;
        self.note = null;
    }
}