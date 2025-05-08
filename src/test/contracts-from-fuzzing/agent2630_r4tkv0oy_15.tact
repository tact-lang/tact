struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: Bool?;
    o6: String?;
    o7: String?;
    o8: Address?;
    o9: Address?;
}

contract ManyOptionalStruct {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{
            o1:null,o2:2,o3:null,o4:true,o5:null,o6:"hi",o7:null,o8:null,o9:myAddress()
        };
    }
}