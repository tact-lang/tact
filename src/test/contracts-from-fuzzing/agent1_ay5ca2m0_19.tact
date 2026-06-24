struct DefaultedStruct {
    a: Int = 5;
    b: Bool = true;
    s: String = "default";
}

contract StructDefaultTest {
    data: DefaultedStruct;

    init() {
        self.data = DefaultedStruct{};
    }
}
