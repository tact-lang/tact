struct BigS {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract StructBigFields {
    val: BigS;

    init() {
        self.val = BigS{
            a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }
}
