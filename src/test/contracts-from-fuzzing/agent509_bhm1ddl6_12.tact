struct InnerA {
    a: Int;
}

struct InnerB {
    b: Int;
}

struct Container {
    ia: InnerA?;
    ib: InnerB?;
}

contract OptionalStructs {
    data: Container;

    init() {
        self.data = Container{
            ia: null,
            ib: InnerB{ b: 9 }
        };
    }
}