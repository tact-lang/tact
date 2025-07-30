struct LargeStruct {
    f1: Int as int256;
    f2: Int as int256;
    f3: Int as int256;
    f4: Int as int256;
    f5: Int as int256;
    f6: Int as int256;
    f7: Int as int256;
    f8: Int as int256;
    f9: Int as int256;
    f10: Int as int256;
}

contract Test {
    receive() {
        let s = LargeStruct{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6,
            f7: 7,
            f8: 8,
            f9: 9,
            f10: 10
        };
    }
}
