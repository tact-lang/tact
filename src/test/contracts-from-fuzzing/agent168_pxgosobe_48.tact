struct OptInner {
    x: Int?;
}

contract RedundantNullStruct {
    s: OptInner? = null;
}
