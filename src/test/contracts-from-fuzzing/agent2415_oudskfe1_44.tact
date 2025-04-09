struct AllTypesStruct {
    i: Int; b: Bool; s: String;
    oi: Int?; ob: Bool?; os: String?;
}

contract AllTypesInOne {
    val: AllTypesStruct;

    init() {
        self.val = AllTypesStruct{
            i:5,b:true,s:"abc",
            oi:null,ob:false,os:"def"
        };
    }
}