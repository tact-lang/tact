// Contract with deeply nested optional -> struct -> optional -> struct structure
struct Leaf {
    val: Int?;
}

struct MidLayer {
    leaf: Leaf?;
    txt: String;
}

struct Root {
    mid: MidLayer?;
    flag: Bool;
}

contract DeepOptNest {
    state: Root;
    init() {
        self.state = Root{
            mid: null,
            flag: true,
        };
    }
}