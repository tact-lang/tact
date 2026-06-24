struct Complex {
    s: Slice?;
    f: Bool?;
    val: Int?;
}

contract TestContract {
    cmp: Complex;

    init() {
        self.cmp = Complex{
            s: null,
            f: true,
            val: 123,
        };
    }
}
