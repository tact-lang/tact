struct Complex {
    a: Int = 1;
    b: Bool = false;
    c: String?;
    d: Address?;
    e: Cell?;
    f: String = "ok";
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 42,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "done"
        };
    }
}