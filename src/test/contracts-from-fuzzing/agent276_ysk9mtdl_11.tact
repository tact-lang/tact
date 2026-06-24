struct ArrayLike {
    el1: Int;
    el2: Int;
    el3: Int;
    el4: Int;
    el5: Int;
}

contract ArrayStruct {
    arrayStruct: ArrayLike;

    init() {
        self.arrayStruct = ArrayLike{
            el1: 1,
            el2: 2,
            el3: 3,
            el4: 4,
            el5: 5
        };
    }
}
