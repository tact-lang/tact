struct Opts {
    addr: Address?;
    cellData: Cell?;
}

contract OptAddressCell {
    vals: Opts;

    init() {
        self.vals = Opts{ addr: null, cellData: emptyCell() };
    }
}