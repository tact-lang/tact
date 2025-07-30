struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract MixedStorage {
    val: ManyTypes;

    init() {
        self.val = ManyTypes{
            a:1,
            b:true,
            c:"test",
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f:beginCell(),
            g:myAddress()
        };
    }
}