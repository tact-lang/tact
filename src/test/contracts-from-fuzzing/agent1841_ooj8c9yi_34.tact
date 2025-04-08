struct SwitchTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
}

contract SwitchOrder {
    s: SwitchTypes;

    init() {
        self.s = SwitchTypes{
            a:7,b:true,c:"ok",d:emptyCell(),e:emptyCell().asSlice(),f:beginCell()
        };
    }
}
