struct DefaultsMix {
    i: Int;
    b: Bool;
    optI: Int?;
    optB: Bool?;
}

contract DefaultMix {
    field: DefaultsMix = DefaultsMix{
        i: 1,
        b: true,
        optI: null,
        optB: null
    };
}