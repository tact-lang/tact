struct StorageOrder {
    valInt: Int;
    valBool: Bool;
    valSlice: Slice;
    valAddr: Address;
    valStr: String;
    valCell: Cell;
}

contract OrderTest {
    content: StorageOrder;

    init() {
        self.content = StorageOrder{
            valInt:1,valBool:true,valSlice:emptyCell().asSlice(),valAddr:myAddress(),valStr:"x",valCell:emptyCell()
        };
    }

    receive() {
        self.content = self.content;
    }
}