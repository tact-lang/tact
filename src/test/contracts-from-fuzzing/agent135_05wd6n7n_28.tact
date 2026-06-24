struct Obscure {
    a: Int as uint256;
    b: Int as int1;
    c: Int as uint4;
}

contract ObscureSizes {
    data: Obscure;

    init() {
        self.data = Obscure{
            a: 1,
            b: 0,
            c: 9
        };
    }
}
