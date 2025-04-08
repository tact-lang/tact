struct AA {
    a: Int;
}

struct BB {
    b: AA;
    c: Int;
}

struct CC {
    d: BB;
    e: Bool?;
}

contract ComplexStructNest {
    data: CC;

    init() {
        self.data = CC{
            d: BB{ b: AA{ a: 5 }, c: 6 },
            e: null
        };
    }
}