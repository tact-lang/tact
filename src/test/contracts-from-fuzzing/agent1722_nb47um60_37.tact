struct DeepOptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract DeepOptContract {
    data: DeepOptStruct;
    init() {
        self.data = DeepOptStruct{
            a:null,
            b:null,
            s:null
        };
    }
}