struct InnerLevel2 {
    x: Int;
}

struct InnerLevel1 {
    lvl2: InnerLevel2;
}

struct TopStruct {
    lvl1: InnerLevel1;
}

contract TestContract {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            lvl1: InnerLevel1{
                lvl2: InnerLevel2{ x: 99 }
            }
        };
    }
}