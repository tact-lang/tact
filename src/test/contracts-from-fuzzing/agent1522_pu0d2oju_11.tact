struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

contract OptStruct {
    data: InnerOpt;
    init() {
        self.data = InnerOpt{
            val: null,
            flag: null,
        };
    }
}