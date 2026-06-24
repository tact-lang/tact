// Contract with deeply nested optional in parameter style
struct DeeplyOptional {
    data: Int?;
}

contract OptParamParam(
    param: DeeplyOptional?
) {
}
