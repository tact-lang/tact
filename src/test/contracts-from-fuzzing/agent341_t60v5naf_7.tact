struct Rec {
    r1: Int;
    r2: Int;
    r3: Int;
    r4: Int;
    r5: Int;
    r6: Int;
    r7: Int;
    r8: Int;
    r9: Int;
    r10: Int;
}

contract ManyInts {
    mem: Rec;

    init() {
        self.mem = Rec{
            r1:1,r2:2,r3:3,r4:4,r5:5,r6:6,r7:7,r8:8,r9:9,r10:10
        };
    }
}