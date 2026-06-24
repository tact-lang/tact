struct DeepParam {
    count: Int;
    flag: Bool;
}

struct TopParam {
    name: String;
    info: DeepParam;
}

contract ParamNested(
    data: TopParam,
) {
    // no init()
}