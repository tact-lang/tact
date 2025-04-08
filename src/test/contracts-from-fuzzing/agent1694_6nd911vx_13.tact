struct Leaf { flag: Bool; val: Int?; }
struct Branch { l: Leaf?; mid: Bool; }
struct Root { left: Branch; right: Branch?; }

contract BoolMix {
    data: Root;

    init() {
        self.data = Root{
            left: Branch{ l: null, mid: true },
            right: null
        };
    }
}