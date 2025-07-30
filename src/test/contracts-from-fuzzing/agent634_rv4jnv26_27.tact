// contract with complex serialization + optional + nested
struct InnerMost {
    si: Int as int7;
    ui: Int as uint6;
}

struct Middle {
    nested: InnerMost?;
    flag: Bool?;
}

contract SerializeDeepOpt {
    val: Middle;

    init() {
        self.val = Middle{nested: null, flag: null};
    }
}