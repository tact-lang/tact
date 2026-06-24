// optional nested struct
struct MaybeNested {
    a: Int;
    b: Inner?;
}

struct Inner {
    c: Int;
    d: Bool?;
}

contract NestedOptionalStruct {
    data: MaybeNested;
    init() {
        self.data = MaybeNested{
            a:10,
            b: Inner{
                c: 20,
                d: null
            }
        };
    }
}