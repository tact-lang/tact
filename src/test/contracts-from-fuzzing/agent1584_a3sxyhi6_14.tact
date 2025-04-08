struct ParamInner {
    x: Int;
    data: Slice as remaining;
}

contract TestContract(
    inner: ParamInner
) {}