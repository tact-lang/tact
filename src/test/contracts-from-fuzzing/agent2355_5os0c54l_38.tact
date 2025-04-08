struct OptSliceStruct {
    s: Slice?;
}

contract SliceHolder {
    f: OptSliceStruct = OptSliceStruct{s: null};
}