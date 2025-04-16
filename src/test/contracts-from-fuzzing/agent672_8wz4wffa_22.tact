struct InOne {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
}

struct Wrapped {
    first: InOne;
    second: InOne;
}

contract NestedMultiFields {
    wrap: Wrapped;

    init() {
        self.wrap = Wrapped{
            first: InOne{a:1,b:true,c:emptyCell().asSlice(),d:emptyCell(),e:myAddress()},
            second: InOne{a:2,b:false,c:emptyCell().asSlice(),d:emptyCell(),e:myAddress()}
        };
    }
}