struct BaseLevel {
    baseVal: Int = 5;
}

struct MidLevel {
    base: BaseLevel;
    midVal: Int = 10;
}

struct TopLevel {
    mid: MidLevel;
    topVal: Int = 15;
}

contract Layered {
    var: TopLevel;

    init() {
        self.var = TopLevel{
            mid: MidLevel{
                base: BaseLevel{baseVal: 50},
                midVal: 100
            },
            topVal: 150
        };
    }
}
