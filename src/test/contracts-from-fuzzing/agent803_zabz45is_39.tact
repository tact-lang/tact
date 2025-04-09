struct LargeOpt {
    f1: Int?; f2: String?; f3: Bool?; f4: Address?;
    f5: Int?; f6: String?; f7: Bool?; f8: Address?;
}

contract OptStruct {
    data: LargeOpt;
    init() {
        self.data = LargeOpt{
            f1:null,f2:null,f3:null,f4:null,
            f5:null,f6:null,f7:null,f8:null
        };
    }
}