// Big mix of defaulted, optional, nested fields
struct SubS {
    a: Int = 1;
    b: Bool?;
}

struct Container {
    s: SubS?;
    str: String?;
    f: Bool = false;
}

contract BigMix {
    store: Container;

    init() {
        self.store = Container{
            s: null,
            str: null,
            f: true,
        };
    }
}
