struct OptL1 {
    mid: OptL2?;
}

struct OptL2 {
    leaf: OptL3?;
}

struct OptL3 {
    value: Int;
    text: String?;
}

contract OptionalDepth {
    root: OptL1;

    init() {
        self.root = OptL1{ mid:null };
    }
}