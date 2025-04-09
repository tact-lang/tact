// Nested struct with string inside nested optional
struct InnerMost {
    message: String;
}

struct Middle {
    nested: InnerMost?;
}

contract TestContract {
    s: Middle;
    init() {
        self.s = Middle {
            nested: InnerMost {
                message: "hi"
            }
        };
    }
}