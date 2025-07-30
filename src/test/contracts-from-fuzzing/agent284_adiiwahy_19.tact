struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: String?;
}

contract Combo {}

contract ComboStore {
    store: Complex;
    
    init() {
        self.store = Complex{
            a: 8,
            b: null,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null
        };
    }
}