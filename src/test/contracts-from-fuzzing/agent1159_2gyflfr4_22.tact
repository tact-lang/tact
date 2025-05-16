struct NestedStruct {
    inner1: Int;
    inner2: Bool;
    inner3: Slice;
}

struct OuterStruct {
    x: Int;
    inn: NestedStruct;
}

contract TestContract {
    o: OuterStruct;

    init() {
        self.o = OuterStruct{
            x: 99,
            inn: NestedStruct{
                inner1: 1,
                inner2: true,
                inner3: emptyCell().asSlice(),
            }
        };
    }
}