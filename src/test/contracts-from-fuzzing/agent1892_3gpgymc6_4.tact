struct OptStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptContract {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            i: null,
            b: null,
            s: null,
        };
    }
}