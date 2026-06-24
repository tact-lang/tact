struct TwoOptionLevel {
    subOpt: Int?;
}

struct TopOpt {
    levelOpt: TwoOptionLevel?;
}

contract OptInOpt {
    innerOpt: TopOpt?;

    init() {
        self.innerOpt = TopOpt{ levelOpt: TwoOptionLevel{ subOpt: 5 } };
    }
}