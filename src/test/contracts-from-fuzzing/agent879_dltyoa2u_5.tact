struct MixType {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract MixedTypesTest {
    field: MixType;

    init() {
        self.field = MixType{
            a:0, b:false, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"test"
        };
    }
}
