// Struct nesting struct with defaults and optionals
struct DeepComplex {
    x: Int = 1;
    y: Bool = true;
    z: String?;
}

struct Holder {
    embedded: DeepComplex;
    flag: Bool;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder {
            flag: true,
            embedded: DeepComplex{},
        };
    }
}