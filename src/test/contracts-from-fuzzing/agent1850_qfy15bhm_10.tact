struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Complex2;
}

struct Complex2 {
    x: Int;
    y: String;
    z: Bool;
}

contract TestContract {
    s: Complex;

    init() {
        self.s = Complex{
            a: 1,
            b: false,
            c: "hi",
            d: beginCell().endCell(),
            e: beginCell().endCell().asSlice(),
            f: myAddress(),
            g: Complex2{
                x: 7,
                y: "nested",
                z: true,
            },
        };
    }
}
