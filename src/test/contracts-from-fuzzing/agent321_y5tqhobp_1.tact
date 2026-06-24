struct InnerStruct {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract NestedStructTest {
    data: InnerStruct = InnerStruct{};
    init() {}
}