struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;
}

contract OptionalsNested {
    cmp: Complex;
    init() {
        self.cmp = Complex{
            a:10, b:null, c:"c", d:null, e:emptyCell().asSlice(), f:null
        };
    }
}