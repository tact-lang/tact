struct InnerMost {
    number: Int;
}

struct OuterOptional {
    a: Int;
    b: InnerMost?;
}

contract PersistOptOpt {
    data: OuterOptional?;

    init() {
        self.data = null;
    }
}