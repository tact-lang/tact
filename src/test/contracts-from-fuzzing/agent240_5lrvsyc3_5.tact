struct DefaultValStruct {
    flag: Bool = false;
    num: Int = 42;
    opt: Int?;
}

contract DefaultValContract {
    data: DefaultValStruct;

    init() {
        self.data = DefaultValStruct{ };
    }
}