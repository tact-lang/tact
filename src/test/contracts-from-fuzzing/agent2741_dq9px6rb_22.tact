struct Outer {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract OuterNulls {
    field: Outer?;

    init() {
        self.field = null;
    }
}