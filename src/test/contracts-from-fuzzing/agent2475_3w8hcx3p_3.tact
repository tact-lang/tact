struct OptStruct {
    flag: Bool?;
    val: Int?;
}

contract OptContract {
    data: OptStruct;
    init() {
        self.data = OptStruct{ flag: true, val: null };
    }
}