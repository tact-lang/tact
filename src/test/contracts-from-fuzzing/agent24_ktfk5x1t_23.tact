struct TestStruct {
    f1: Int;
    f2: Int?;
    f3: String
}

fun testConversion() {
    let a: TestStruct = TestStruct { f1: 10, f2: 99, f3: "Hello" };
    let cell = a.toCell();
    let b: TestStruct = TestStruct.fromCell(cell);
    let sum: Int = b.f1 + ((b.f2)!!);
    let _ = sum;
    return;
}

contract TestContract {
    receive() {
        testConversion();
        return;
    }
}
