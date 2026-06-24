struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

struct OuterContainer {
    nested: MixedPrimitives;
}

contract TestContract {
    val: OuterContainer;

    init() {
        self.val = OuterContainer{
            nested: MixedPrimitives{
                a:1, b:false, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"abc"
            }
        };
    }
}
