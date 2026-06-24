struct OptionalBoolInt {
    a: Bool?;
    b: Int?;
    c: Bool?;
    d: Int?;
}

contract ChainOpts {
    optField: OptionalBoolInt = OptionalBoolInt{
        a:null, b:null, c:null, d:null
    };
}