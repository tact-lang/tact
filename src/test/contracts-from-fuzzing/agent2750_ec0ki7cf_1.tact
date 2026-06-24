struct DeeplyNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    x: Int?;
    y: Bool;
}

contract TestNested {
    field: DeeplyNested;
    init() {
        self.field = DeeplyNested {
            inner1: Inner1 {
                inner2: Inner2 {
                    x: null,
                    y: true
                }
            }
        };
    }
}
