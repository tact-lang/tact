// Test large nested optional struct fields
struct DeepOpt {
    o1: InnerOpt?;
    o2: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: String;
    c: Bool?;
}

contract DeepOptionalStructs {
    v: DeepOpt;

    init() {
        self.v = DeepOpt{
            o1: null,
            o2: null
        };
    }
}
