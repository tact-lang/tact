// test: persistent field with deeply nested optional struct
struct InnerMost {
    data: String;
}

struct Middle {
    innerOpt: InnerMost?;
}

contract PersistOptDeep {
    m: Middle?;

    init() {
        self.m = null;
    }
}
