struct MultiLayerOpt {
    lvl1: Layer1Opt;
}

struct Layer1Opt {
    lvl2opt: Layer2Opt?;
    val1: Int;
}

struct Layer2Opt {
    lvl3opt: Layer3Opt?;
    flag: Bool;
}

struct Layer3Opt {
    value: Int?;
    note: String?;
}

contract MultiLayerOptContract {
    data: MultiLayerOpt = MultiLayerOpt{
        lvl1: Layer1Opt{
            lvl2opt: null,
            val1: 7
        }
    };
}