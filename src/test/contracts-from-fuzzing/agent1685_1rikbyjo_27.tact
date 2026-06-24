struct TupleInStruct {
    a: Int;
    b: Bool;
    c: Address;
}

struct WrapTuple {
    inner: TupleInStruct;
}

contract StructNestTest {
    data: WrapTuple;

    init() {
        self.data = WrapTuple{
            inner: TupleInStruct{
                a: 1,
                b: false,
                c: myAddress()
            }
        };
    }
}
