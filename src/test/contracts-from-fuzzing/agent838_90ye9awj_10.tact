struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    s: Complex;
    init() {
        self.s = Complex{
            a:42, b:true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(), f: "hi"
        };
    }
}