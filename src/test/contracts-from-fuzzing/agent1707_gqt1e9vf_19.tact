struct Complex {
    inner1: Int;
    inner2: Int?;
    inner3: Bool;
    inner4: Bool?;
    inner5: Address;
    inner6: Address?;
}

contract ComplexInner {
    data: Complex;

    init() {
        self.data = Complex{
            inner1: 1,
            inner2: null,
            inner3: true,
            inner4: null,
            inner5: myAddress(),
            inner6: null
        };
    }
}