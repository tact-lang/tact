struct TestStruct {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    a11: Int;
    a12: Int;
    a13: Int;
    a14: Int;
    a15: Int;
    a16: Int;
    a17: Int;
    a18: Int;
}

contract TestContract {
    receive() {
        let test = TestStruct{
            a1: 1,
            a2: 1,
            a3: 1,
            a4: 1,
            a5: 1,
            a6: 1,
            a7: 1,
            a8: 1,
            a9: 1,
            a10: 1,
            a11: 1,
            a12: 1,
            a13: 1,
            a14: 1,
            a15: 1,
            a16: 1,
            a17: 1,
            a18: 1,
        };
    }
}