struct OptAddr {
    a: Address?;
    b: Address?;
    c: Address?;
}

contract ManyOptAddr {
    st: OptAddr;

    init() {
        self.st = OptAddr{
            a: null,
            b: myAddress(),
            c: null
        };
    }
}