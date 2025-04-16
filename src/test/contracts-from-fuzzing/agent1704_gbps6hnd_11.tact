struct SubNested {
    x: Int;
    y: Bool;
}

struct Complex {
    flag: Bool;
    inner: SubNested;
    optInner: SubNested?;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            flag: true,
            inner: SubNested{ x:1, y:true },
            optInner: null,
        };
    }
}