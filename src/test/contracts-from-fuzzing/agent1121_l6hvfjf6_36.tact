// optional Cell inside nested struct
struct S {
    c: Cell?;
}

contract OptionCellInsideStruct {
    s: S;

    init() {
        self.s = S{c:null};
    }
}