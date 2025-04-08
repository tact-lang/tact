struct Complex {
    s: String;
    addr: Address;
    flag: Bool;
}

contract ComplexTypesTest {
    info: Complex;

    init() {
        self.info = Complex{
            s: "abc",
            addr: myAddress(),
            flag: true
        };
    }

    receive() {
        self.info = Complex{
            s: "def",
            addr: myAddress(),
            flag: false
        };
    }
}