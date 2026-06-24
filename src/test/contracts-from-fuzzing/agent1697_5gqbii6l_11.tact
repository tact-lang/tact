struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract TestContract {
    m: MixedPrimitives;
    init() {
        self.m = MixedPrimitives{
            a:1, b:true, c:myAddress(), d:"text", e:emptyCell(), f:emptyCell().asSlice(), g: beginCell()
        };
    }
}