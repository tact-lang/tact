struct ManyBooleans {
    a: Bool; b: Bool; c: Bool; d: Bool; e: Bool;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
}

contract ManyBoolStruct {
    data: ManyBooleans;

    init() {
        self.data = ManyBooleans{
            a:true,b:true,c:false,d:true,e:false,
            f:false,g:true,h:false,i:true,j:true
        };
    }
}