struct A {
    intVal: Int;
    boolVal: Bool;
}

struct B {
    strVal: String;
    innerA: A;
}

struct C {
    sliceVal: Slice;
    innerB: B;
}

contract MultiLayered {
    storageVal: C;

    init() {
        self.storageVal = C{
            sliceVal: emptyCell().asSlice(),
            innerB: B{
                strVal: "deep",
                innerA: A{
                    intVal: 88,
                    boolVal: false
                }
            }
        };
    }
}