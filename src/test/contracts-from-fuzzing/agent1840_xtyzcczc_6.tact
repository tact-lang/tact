struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrapper {
    x: NestedOpt;
    y: Int;
}

contract OptContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            x: NestedOpt{ a: null, b: true, c: null },
            y: 5
        };
    }
}