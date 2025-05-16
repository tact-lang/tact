struct OptAddrCell {
    a: Address?;
    c: Cell?;
}

contract OptionalAddrCell {
    data: OptAddrCell;

    init() {
        self.data = OptAddrCell{ a:null, c:null };
    }
}