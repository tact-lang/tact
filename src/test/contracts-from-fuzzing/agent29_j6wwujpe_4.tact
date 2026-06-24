struct LongStruct {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
}

contract LongStructContract {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a0: 0, a1: 1, a2: 2, a3:3, a4:4, a5:5, a6:6, a7:7, a8:8, a9:9
        };
    }
}