struct OptStruct {
    a: Int?;
    b: String?;
    c: Cell?;
}

contract AssignNulls {
    data: OptStruct;
    init() {
        self.data = OptStruct{ a: null, b: null, c: null };
    }
}