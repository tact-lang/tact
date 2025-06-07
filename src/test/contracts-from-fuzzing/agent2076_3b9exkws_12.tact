struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
    bl: Builder;
}

contract TestContract {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i:1, b:true, s:"s", c:emptyCell(), a:myAddress(), sl:emptyCell().asSlice(), bl:beginCell()
        };
    }
}