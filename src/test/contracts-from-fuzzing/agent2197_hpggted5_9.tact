struct RecA {
    foo: Int;
}

struct RecB {
    bar: RecA?;
}

contract OptNested {
    data: RecB;

    init() {
        self.data = RecB{ bar:null };
    }
}