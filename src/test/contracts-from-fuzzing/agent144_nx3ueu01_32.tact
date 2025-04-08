struct SL {
    s: String;
    sl: Slice;
}

contract StructStringSlice {
    slobj: SL;

    init() {
        self.slobj = SL{s:"hi", sl: emptyCell().asSlice()};
    }
}
