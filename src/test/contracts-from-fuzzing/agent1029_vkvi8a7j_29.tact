struct AllPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract PrimitiveContract {
    val: AllPrimitives;
    init() {
        self.val = AllPrimitives{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"hi"
        };
    }
}