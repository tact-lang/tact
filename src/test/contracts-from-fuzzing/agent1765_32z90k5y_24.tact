struct Leaf { val: Int?; }
struct Mid {
    left: Leaf?;
    right: Leaf?;
}
struct Root {
    mid: Mid?;
}
contract DeepOpt {
    root: Root;
    init() {
        self.root = Root{
            mid: Mid{
                left: null,
                right: Leaf{ val: 123 }
            }
        };
    }
}