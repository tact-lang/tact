struct OptionalsWide {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?;
    o5: String?; o6: String?; o7: String?; o8: String?;
    o9: Bool?; o10: Bool?; o11: Bool?; o12: Bool?;
}

contract WideOptional {
    ws: OptionalsWide;

    init() {
        self.ws = OptionalsWide{
            o1:null,o2:2,o3:null,o4:4,
            o5:null,o6:"x",o7:null,o8:"y",
            o9:true,o10:null,o11:false,o12:null
        };
    }
}