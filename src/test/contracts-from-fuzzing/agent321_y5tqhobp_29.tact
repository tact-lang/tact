struct SimpleStruct {
    a: Int = 1;
}

contract DuplicateFieldTest {
    x: SimpleStruct = SimpleStruct{};
    y: SimpleStruct = SimpleStruct{};
    init() {}
}