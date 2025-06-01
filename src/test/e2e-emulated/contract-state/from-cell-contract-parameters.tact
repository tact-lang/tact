//
// Test.fromCell(self.toCell()) = self
//

message(0x112766e0) NewContractData {
    cell: Cell;
}

contract Test(
    x: Int as uint32,
    y: Int as uint32,
) {
    receive() {}

    receive(msg: NewContractData) {
        let c = Test.fromCell(msg.cell);
        self.x = c.x;
        self.y = c.y;
    }

    get fun state(): Test {
        return self;
    }

    get fun inverseLaw(): Bool {
        return (Test.fromCell(self.toCell())).toCell() == self.toCell();
    }
}
