struct DefaultParamStruct {
    x: Int = 1;
    y: Bool = false;
}

contract ParamWithDefaults(
    param: DefaultParamStruct,
) {}
// test: param using struct with defaults