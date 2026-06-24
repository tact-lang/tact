struct AllBasics {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract TestContract {
    val: AllBasics;

    init() {
        self.val = AllBasics{
            i:1,b:true,s:"h",a:myAddress(),c:emptyCell(),sl:emptyCell().asSlice(),bu:beginCell()
        };
    }
}