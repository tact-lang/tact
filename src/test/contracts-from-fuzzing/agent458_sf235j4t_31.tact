struct DefaultOptStruct {
    x: Int?;
    y: Bool = true;
}

contract NestedDefaultOpt {
    s: DefaultOptStruct = DefaultOptStruct{
        x: null,
        y: false
    };
}