struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MixedFields {
    val: Mixed;

    init() {
        self.val = Mixed{
            a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }
}
