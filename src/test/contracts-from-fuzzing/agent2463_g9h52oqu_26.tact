struct S {
   i: Int;
   o: Int?;
}

contract OptInStruct {
    data: S = S{
        i: 0,
        o: null
    };

    init() {}
}
