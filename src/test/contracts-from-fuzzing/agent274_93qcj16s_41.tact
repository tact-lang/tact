struct IntStruct1 {
    a: Int;
}

struct IntStruct2 {
    b: Int;
    c: Int;
}

struct NestedInts {
    s1: IntStruct1;
    s2: IntStruct2;
}

contract IntNestTest {
    payload: NestedInts;

    init() {
        self.payload = NestedInts{
            s1: IntStruct1{a: 1},
            s2: IntStruct2{b: 2, c: 3},
        };
    }
}