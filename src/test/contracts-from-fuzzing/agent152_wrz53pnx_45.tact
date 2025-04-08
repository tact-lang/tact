struct SizedStruct {
    a: Int as uint4;
    b: Int as int4;
}

contract SizedStructContract {
    data: SizedStruct;

    init() {
        self.data = SizedStruct{ a:15, b:-8 };
    }
}