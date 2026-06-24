struct OptionalWide {
    v1: Int?; v2: Int?; v3: Int?; v4: Int?; v5: Int?;
    v6: Bool?; v7: Bool?; v8: Bool?; v9: Bool?; v10: Bool?;
    v11: String?; v12: String?; v13: String?; v14: String?; v15: String?;
    v16: Address?; v17: Address?; v18: Address?; v19: Address?; v20: Address?;
}

contract OptionalWideContract {
    x: OptionalWide;

    init() {
        self.x = OptionalWide{
            v1:null,v2:2,v3:null,v4:4,v5:null,
            v6:true,v7:null,v8:false,v9:null,v10:true,
            v11:null,v12:"b",v13:null,v14:"d",v15:null,
            v16:null,v17:myAddress(),v18:null,v19:myAddress(),v20:null
        };
    }
}