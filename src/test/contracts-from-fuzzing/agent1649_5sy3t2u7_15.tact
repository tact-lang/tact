struct Generic {
    flag: Bool;
    value: Int;
    text: String;
    maybe: Bool?;
    num: Int?;
    sopt: String?;
}

contract BulkFields {
    g1: Generic;
    g2: Generic;
    g3: Generic;

    init() {
        self.g1 = Generic{flag:true,value:1,text:"a",maybe:null,num:null,sopt:null};
        self.g2 = Generic{flag:false,value:2,text:"b",maybe:null,num:null,sopt:null};
        self.g3 = Generic{flag:true,value:3,text:"c",maybe:null,num:null,sopt:null};
    }
}