struct Simple {
    a: Int;
}

struct NestedOpt {
    opt: Simple?;
}

contract OptStructField {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ opt: null };
    }
}