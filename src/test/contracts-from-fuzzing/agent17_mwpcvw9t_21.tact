struct NestedOpt {
    opt: Int?;
}

struct DoubleNestedOpt {
    nest: NestedOpt?;
}

contract DoubleNull {
    nn: DoubleNestedOpt = DoubleNestedOpt{nest:null};
}