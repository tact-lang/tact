struct OptStruct {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            val: null,
            flag: true,
            text: null,
        };
    }
}