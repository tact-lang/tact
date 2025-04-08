struct OneRef {
    val: Int;
}

struct ManyRefs {
    r1: OneRef;
    r2: OneRef;
    r3: OneRef;
    r4: OneRef;
    r5: OneRef;
}

contract StructsOfStructs {
    data: ManyRefs;

    init() {
        self.data = ManyRefs{
            r1: OneRef{ val: 1 },
            r2: OneRef{ val: 2 },
            r3: OneRef{ val: 3 },
            r4: OneRef{ val: 4 },
            r5: OneRef{ val: 5 }
        };
    }
}