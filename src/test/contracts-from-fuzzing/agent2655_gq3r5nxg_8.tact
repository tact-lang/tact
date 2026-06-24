struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    nested: InnerMost;
    c: String?;
}

struct Outer {
    d: Middle;
    e: Address?;
}

contract deeplyOptional {
    data: Outer?;

    init() {
        self.data = null;
    }
}