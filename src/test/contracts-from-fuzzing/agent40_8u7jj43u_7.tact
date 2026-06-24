struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    nested: NestedOptionals?;
}

contract TestNestedOpt {
    data: Holder;

    init() {
        self.data = Holder{nested: null};
    }

    receive() {
        let tmp = self.data;
    }
}