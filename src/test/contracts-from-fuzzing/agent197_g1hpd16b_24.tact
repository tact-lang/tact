struct SliceOptions {
    a: Slice? = null;
    b: Slice? = null;
    c: Slice? = null;
    d: Slice? = null;
}

contract SliceOptionals {
    slices: SliceOptions = SliceOptions{
        a:null, b:null, c:null, d:null
    };
}