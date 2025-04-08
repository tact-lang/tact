struct Complex {
    s: String;
    sl: Slice;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            s: "hello",
            sl: emptyCell().asSlice(),
        };
    }
}