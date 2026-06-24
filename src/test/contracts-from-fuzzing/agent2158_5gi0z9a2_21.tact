contract TwoOptionalStructs {
    s1: Struct1?;
    s2: Struct2?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}

struct Struct1 {
    val: Int;
}

struct Struct2 {
    text: String;
}