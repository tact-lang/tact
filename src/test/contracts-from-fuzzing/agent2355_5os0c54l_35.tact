struct ZeroStruct {
    val: Int = 0;
}

contract ZeroDefault {
    f: ZeroStruct;

    init() {
        self.f = ZeroStruct{};
    }
}