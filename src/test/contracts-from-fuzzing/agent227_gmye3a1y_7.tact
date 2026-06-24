struct BoolIntMix {
    flag1: Bool;
    count: Int;
    flag2: Bool;
    sum: Int;
}

contract TestContract {
    data: BoolIntMix;

    init() {
        self.data = BoolIntMix{ flag1:true, count:5, flag2:false, sum:15 };
    }
}