struct InnerParam {
    flag: Bool?;
    count: Int as uint4;
}

struct OuterParam {
    label: String?;
    data: InnerParam;
}

contract MultiLayerParamContract(
    config: OuterParam,
) {}
