struct LayerA {
    id: Int;
    val: String;
}

struct LayerB {
    a: LayerA;
    note: String;
}

contract DifferentOrdering {
    data1: LayerA;
    data2: LayerB;

    init() {
        self.data1 = LayerA{ id:1, val:"one" };
        self.data2 = LayerB{ a:LayerA{ id:2, val:"two" }, note:"B" };
    }
}