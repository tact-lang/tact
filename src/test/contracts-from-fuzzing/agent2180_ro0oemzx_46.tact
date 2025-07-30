struct DefaultedStruct {
    i: Int = 42;
    b: Bool = true;
    s: String = "x";
}

contract ContractParamWithDefaults(
    data: DefaultedStruct,
) {}