struct DefaultsStruct {
    a: Int = 5;
    b: Bool = true;
    s: String = "hello";
}

contract TestContract {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};
    }
}