struct InnerOpt {
    x: Int?;
}

contract OptDefaultNull {
    field: InnerOpt = InnerOpt{x:null};
}