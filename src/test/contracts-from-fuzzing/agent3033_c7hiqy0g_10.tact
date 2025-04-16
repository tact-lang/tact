struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract TestContract {
    storage: Combo;

    init() {
        self.storage = Combo{
            a:7, b:false, c:myAddress(), d:"hi", e:emptyCell(), f:emptyCell().asSlice(), g:beginCell()
        };
    }
}
