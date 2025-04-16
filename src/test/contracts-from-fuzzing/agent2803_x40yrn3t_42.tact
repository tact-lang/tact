struct NestedFinal {
    mid: Middle;
}

struct Middle {
    deep: Deep;
}

struct Deep {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract NestedFinalContract {
    nn: NestedFinal;

    init() {
        self.nn = NestedFinal{mid: Middle{deep: Deep{v1:1,v2:true,v3:""}}};
    }
}