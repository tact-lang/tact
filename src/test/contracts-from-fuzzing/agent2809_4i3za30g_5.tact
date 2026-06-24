struct Complex {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{};
    }
}