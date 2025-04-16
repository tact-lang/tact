struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract MixedPrimitivesTest {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"xyz"
        };
    }
}