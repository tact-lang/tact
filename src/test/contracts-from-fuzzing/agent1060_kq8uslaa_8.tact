struct DefaultsStruct {
    x: Int = 77;
    y: Bool = false;
}

contract ParamWithDefaults(
    val: Int,
    ds: DefaultsStruct,
) {}