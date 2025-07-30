// test optional Address and Cell in storage
contract Test {
    addy: Address?;
    cello: Cell?;

    init() {
        self.addy = null;
        self.cello = null;
    }
}