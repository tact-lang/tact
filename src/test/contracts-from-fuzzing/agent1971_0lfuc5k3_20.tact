struct BigNested {
    x: Int;
    y: Int;
    z: Int;
    a: Bool;
    b: Bool?;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

contract BigNestedFields {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            x:1,y:2,z:3, a:true, b:null, c:"abc", d:myAddress(),
            e:emptyCell().asSlice(), f:emptyCell()
        };
    }
}
