struct WrapOpt {
    x: Int?;
    s: String?;
}

contract NestedOptDefaults {
    data: WrapOpt = WrapOpt{x:null,s:null};
}