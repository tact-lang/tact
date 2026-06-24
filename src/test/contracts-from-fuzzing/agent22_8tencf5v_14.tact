// Many null defaults with explicitly non-optional composite
struct Sub {
    x: Int;
    y: String;
}

contract NullStructFields {
    s1: Sub?;
    s2: Sub?;
    s3: Sub?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}