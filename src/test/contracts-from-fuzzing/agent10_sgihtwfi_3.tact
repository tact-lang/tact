struct LargeStruct {
    f1: Int as uint16;
    f2: Int as uint16;
    f3: Int as uint16;
    f4: Int as uint16;
    f5: Int as uint16;
    f6: Int as uint16;
    f7: Int as uint16;
    f8: Int as uint16;
    f9: Int as uint16;
    f10: Int as uint16;
}

contract Test {
    receive() {
        let ls = LargeStruct {
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5,
            f6: 6, f7: 7, f8: 8, f9: 9, f10: 10
        };
    }
}
