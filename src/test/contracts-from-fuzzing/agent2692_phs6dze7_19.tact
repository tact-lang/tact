struct Layer1 {
    a: Int?;
    b: Int;
}

struct Layer2 {
    x: Layer1;
    y: Bool?;
}

struct Layer3 {
    m: Layer2;
    n: String?;
}

contract OptionalInDepth {
    deep: Layer3?;

    init() {
        self.deep = null;
    }
}
