struct NestedData {
    addrOpt: Address?;
    sliceOpt: Slice?;
}

struct Wrapper {
    inner: NestedData?;
}

contract SliceAddrDeep {
    store: Wrapper = Wrapper{};
}