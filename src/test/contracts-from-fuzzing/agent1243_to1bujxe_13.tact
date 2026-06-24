struct HasOptField {
    s: String?;
}

struct OuterOpt {
    inner: HasOptField?;
}

contract Test {
    x: OuterOpt;
    init() {
        self.x = OuterOpt{ inner: null };
    }
}