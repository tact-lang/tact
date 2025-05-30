struct ReverseOrder {
    f1: Cell;
    f2: String;
    f3: Address;
    f4: Slice;
    f5: Bool;
    f6: Int;
}

contract ReverseOrderStore {
    record: ReverseOrder;

    init() {
        self.record = ReverseOrder{
            f1:emptyCell(),f2:"s",f3:myAddress(),f4:emptyCell().asSlice(),f5:true,f6:42
        };
    }

    receive() {
        self.record = self.record;
    }
}