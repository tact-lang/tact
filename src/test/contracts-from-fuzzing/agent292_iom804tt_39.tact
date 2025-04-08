struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract AllFieldTypes {
    m: MultiType;

    init() {
        self.m = MultiType{
            a:1,b:true,c:"ok",
            d:emptyCell(),e:emptyCell().asSlice(),f:beginCell(),g:myAddress()
        };
    }
}