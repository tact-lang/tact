struct AddressHolder {
    addr: Address;
}

struct SliceHolder {
    s: Slice;
}

contract MultiplePrimitives {
    a: AddressHolder;
    s: SliceHolder;

    init() {
        self.a = AddressHolder{ addr: myAddress() };
        self.s = SliceHolder{ s: emptyCell().asSlice() };
    }

    receive() {
        self.a = AddressHolder{ addr: myAddress() };
        self.s = SliceHolder{ s: emptyCell().asSlice() };
    }
}