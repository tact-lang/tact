// Deep nested initialization that partially omits inner optional branches
struct DeepInner {
    a: Int?;
    b: String?;
}

struct Mid {
    inner: DeepInner?;
}

struct Top {
    mid: Mid?;
    label: String;
}

contract PartialDeepOmit {
    root: Top;

    init() {
        self.root = Top{
            mid: null,
            label: "Root"
        };
    }
}