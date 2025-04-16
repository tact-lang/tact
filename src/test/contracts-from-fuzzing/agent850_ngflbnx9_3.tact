struct DeepOpt {
    s1: String?;
    s2: String?;
    num: Int?;
    flag: Bool?;
}

contract DeepOptContract {
    deep: DeepOpt;
    
    init() {
        self.deep = DeepOpt{
            s1: null,
            s2: "hello",
            num: null,
            flag: true
        };
    }
}
