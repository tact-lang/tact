struct Params {
    intVal: Int = 123;
    boolVal: Bool = true;
    textVal: String = "hello";
}

contract DefaultsInStruct {
    data: Params;

    init() {
        self.data = Params{};
    }
}
