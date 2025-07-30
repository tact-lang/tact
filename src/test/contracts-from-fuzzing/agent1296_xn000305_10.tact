struct Complex {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    cell1: Cell;
    slice1: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    fancy: Complex;

    init() {
        self.fancy = Complex{
            int1: 1,
            bool1: true,
            addr1: myAddress(),
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            optInt: null,
            optBool: false,
            optAddr: null,
            inner: Inner{
                foo: 42,
                bar: true,
            },
        };
    }
}