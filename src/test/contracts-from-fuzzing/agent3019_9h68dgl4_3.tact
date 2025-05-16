struct InnerStruct {
    x: Int = 1;
    y: Int = 2;
}

contract TestContract {
    inner: InnerStruct = InnerStruct{};
    foo: Int = 10;
}