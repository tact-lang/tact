// nested optionals with both primitives and structs optional
struct InnerOpt {
    n: Int?;
    t: String?;
}

struct Outs {
    a: InnerOpt?;
    x: Int?;
}

contract Test {
    data: Outs;

    init() {
        self.data = Outs{
            a: null,
            x: null
        };
    }
}