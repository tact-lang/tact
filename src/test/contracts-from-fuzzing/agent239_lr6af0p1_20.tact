struct TwoStringStruct {
    a: String;
    b: String;
}

contract TwoStringContract {
    data: TwoStringStruct;

    init() {
        self.data = TwoStringStruct{ a: "foo", b: "bar" };
    }
}