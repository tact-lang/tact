struct ParamNested {
    nestedInt: Int;
}

contract NestedParamContract(
    param: ParamNested
) {
    get fun getNested(): Int {
        return self.param.nestedInt;
    }
}