struct DefaultInnerOpt {
    value: Int?;
}

contract DefaultOptInnerUse {
    s: DefaultInnerOpt = DefaultInnerOpt{value:null};
}