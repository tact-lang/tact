struct DefaultedStruct {
    flag: Bool = false;
    count: Int = 0;
    message: String = "hello";
}

contract DefaultsContract {
    data: DefaultedStruct;

    init() {
        self.data = DefaultedStruct{};
    }
}
