struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Complex { i1: Inner1; i2: Inner2; flag: Bool; count: Int; text: String; slice: Slice; cell: Cell; addr: Address; }

contract TestContract {
    state: Complex;
    init() {
        self.state = Complex{
            i1: Inner1{a: 1},
            i2: Inner2{b: true},
            flag: false,
            count: 42,
            text: "Hello",
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            addr: myAddress()
        };
    }
}
