struct NestedInner {
    a: Int;
    b: map<Address, Int>; // no optional element inside map
}

struct MidStruct {
    inner: NestedInner;
    optFlag: Bool?;
}

struct OuterStruct {
    mid: MidStruct;
    count: Int;
}

contract FixNestedMap {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            mid: MidStruct{
                inner: NestedInner{
                    a: 10,
                    b: emptyMap(),
                },
                optFlag: null,
            },
            count: 5,
        };
    }
}