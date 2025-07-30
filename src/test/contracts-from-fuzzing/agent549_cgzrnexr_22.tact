struct LongStruct {
    a: Int; b: Bool; c: Int?; d: Bool?; e: Int;
    f: Bool; g: Int?; h: Bool?; i: Int; j: Bool;
}
contract HugeOne {
    f1: LongStruct;
    f2: LongStruct;

    init() {
        self.f1 = LongStruct{a:1,b:true,c:null,d:null,e:5,f:false,g:null,h:null,i:10,j:true};
        self.f2 = LongStruct{a:2,b:false,c:null,d:null,e:6,f:true,g:null,h:null,i:11,j:false};
    }

    receive() {
        self.f1 = LongStruct{a:3,b:true,c:7,d:true,e:8,f:false,g:9,h:false,i:12,j:true};
        self.f2 = LongStruct{a:13,b:false,c:14,d:false,e:15,f:true,g:16,h:true,i:17,j:false};
    }
}