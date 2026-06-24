struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract ManyPrimitiveFields {
    val: MixedPrimitives;

    init() {
        self.val = MixedPrimitives{
            a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:myAddress()
        };
    }
}