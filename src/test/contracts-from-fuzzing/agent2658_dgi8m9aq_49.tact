struct OptionalSliceStruct {
    s: Slice?;
}

contract OptionalSliceStructContainer {
    os: OptionalSliceStruct = OptionalSliceStruct{ s: null };
}