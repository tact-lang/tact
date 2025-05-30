struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    o1: Int?;
    o2: Address?;
}

contract TestContract {
    data: Mixed;
    init() {
        self.data = Mixed{
            i:1, b:true, s:"x", c:emptyCell(), sl:emptyCell().asSlice(), bu:beginCell(), o1:null, o2:null
        };
    }
}
