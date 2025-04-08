struct Complex {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: Int?;
    f: Bool;
    g: Cell?;
    h: Cell;
    i: Bool?;
    j: Int;
}

contract ManyOptionalTest {
    field: Complex;

    init() {
        self.field = Complex{
            a: null,
            b: 1,
            c: null,
            d: true,
            e: null,
            f: false,
            g: null,
            h: emptyCell(),
            i: true,
            j: 42
        };
    }
}
