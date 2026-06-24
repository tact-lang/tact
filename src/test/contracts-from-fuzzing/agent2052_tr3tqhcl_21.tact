struct TestStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract ComplexDefaultInit {
    val: TestStruct = TestStruct{a: 1, b: true, c: "x"};
}