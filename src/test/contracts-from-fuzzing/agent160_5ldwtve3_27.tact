struct OptBoolStr {
    flag: Bool?;
    text: String?;
}

contract TestOptBoolStr {
    data: OptBoolStr;
    init() {
        self.data = OptBoolStr{
            flag:null,
            text:null,
        };
    }
}