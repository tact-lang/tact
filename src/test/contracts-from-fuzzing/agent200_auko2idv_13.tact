struct MultipleLayers {
    first: Int;
    second: LayerTwo;
}

struct LayerTwo {
    third: LayerThree;
    val: Bool;
}

struct LayerThree {
    num: Int as uint64;
}

contract MultiLayered {
    data: MultipleLayers;
    init() {
        self.data = MultipleLayers{
            first: 1,
            second: LayerTwo{
                third: LayerThree{num: 123456},
                val: true
            }
        };
    }
}