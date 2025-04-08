// nested struct with Address and Cell
struct Data {
    addr: Address;
    cell: Cell;
}

contract Test {
    d: Data;
    init() {
        self.d = Data{
            addr: myAddress(),
            cell: emptyCell()
        };
    }
}