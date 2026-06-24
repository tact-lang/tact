struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MixedTypesTest {
    s: MixedTypes;

    init() {
        self.s = MixedTypes{
            a:1, b:true, c:"abc", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }
}