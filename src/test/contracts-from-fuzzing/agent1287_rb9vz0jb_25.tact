// Struct with many different primitive types
struct AllPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract TestContract {
    d: AllPrimitives;

    init() {
        self.d = AllPrimitives{
            i:1, b:true, s:"hi", c:emptyCell(), sl:emptyCell().asSlice(), bu:beginCell(), a:myAddress()
        };
    }
}