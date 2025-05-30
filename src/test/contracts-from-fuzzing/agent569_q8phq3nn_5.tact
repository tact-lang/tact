struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            a: null,
            b: true,
            s: null,
        };
    }
}