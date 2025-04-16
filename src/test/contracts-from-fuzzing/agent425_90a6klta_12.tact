struct SOpt {
    val: Int?;
}

struct SLvl2 {
    sub: SOpt;
    val2: Int?;
}

struct SLvl3 {
    l2: SLvl2;
    val3: Int;
}

contract TestContract {
    deep: SLvl3;

    init() {
        self.deep = SLvl3{
            l2: SLvl2{ sub: SOpt{ val:null }, val2:5 },
            val3: 100
        };
    }
}