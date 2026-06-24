struct Data {
    str: String? = null;
    intField: Int = 0;
    b: Bool = false;
}

contract DefaultedStruct {
    d: Data;

    init() {
        self.d = Data{};
    }
}