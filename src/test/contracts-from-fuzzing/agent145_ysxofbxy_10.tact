struct S1 {
    bool1: Bool;
    int1: Int;
    bool2: Bool;
    int2: Int;
}

struct S2 {
    inner: S1;
    int3: Int;
    bool3: Bool;
}

contract AlternateFields {
    data: S2;

    init() {
        self.data = S2 {
            inner: S1 {
                bool1:true, int1:1, bool2:false, int2:2
            },
            int3:3, bool3:true
        };
    }
}