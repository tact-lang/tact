struct LargeOptionalStrings {
    s1:String?; s2:String?; s3:String?; s4:String?; s5:String?;
    s6:String?; s7:String?; s8:String?; s9:String?; s10:String?;
}

contract StorageLargeOptionalStrings {
    data: LargeOptionalStrings;

    init() {
        self.data = LargeOptionalStrings{
            s1:null, s2:null, s3:null, s4:null, s5:null,
            s6:null, s7:null, s8:null, s9:null, s10:null
        };
    }
}