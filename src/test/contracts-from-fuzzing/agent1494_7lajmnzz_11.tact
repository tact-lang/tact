struct A {
    bools: Bool;
    ints: Int;
    strings: String;
    address: Address;
    cell: Cell;
    slice: Slice;
}

contract MixFields {
    vars: A;
    init() {
        self.vars = A{
            bools:true, ints:0, strings:"", address:myAddress(), cell:emptyCell(), slice:emptyCell().asSlice()
        };
    }
}