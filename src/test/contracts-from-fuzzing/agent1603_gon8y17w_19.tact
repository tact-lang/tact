struct ManyOptionStruct {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract LotsOptionals {
    fld: ManyOptionStruct;

    init() {
        self.fld = ManyOptionStruct{
            a:null,b:1,c:null,d:2,e:null,
            f:true,g:null,h:false,i:null,j:true
        };
    }
}