struct BoolConsts {
    a: Bool;
    b: Bool;
}

contract BoolDefaults {
    bc: BoolConsts = BoolConsts{
        a:true, b:false
    };
}