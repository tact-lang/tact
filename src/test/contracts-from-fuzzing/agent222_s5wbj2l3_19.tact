struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract DefaultOpt {
    data: OptStruct = OptStruct{ a: null, b: true };
}