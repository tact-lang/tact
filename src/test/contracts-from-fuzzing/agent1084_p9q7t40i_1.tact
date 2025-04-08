struct InnerStruct {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    nested: InnerStruct = InnerStruct{};
    init() {}
    receive() {}
}