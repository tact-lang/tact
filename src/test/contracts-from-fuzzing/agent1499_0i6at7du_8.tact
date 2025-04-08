struct ArrOpt {
    a0: Int?;
    a1: Int?;
    a2: Int?;
    a3: Int?;
    a4: Int?;
}

contract FakeArrOpt {
    arr: ArrOpt;
    init() {
        self.arr = ArrOpt{
            a0:null, a1:1, a2:null, a3:3, a4:null
        };
    }
    receive() {}
}