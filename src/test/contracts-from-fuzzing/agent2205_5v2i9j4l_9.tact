struct ManyBools {
    a: Bool; b: Bool; c: Bool; d: Bool;
    e: Bool; f: Bool; g: Bool; h: Bool;
    i: Bool; j: Bool; k: Bool; l: Bool;
}

contract BoolPacking {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            a:true,b:true,c:true,d:true,
            e:false,f:false,g:true,h:false,
            i:true,j:true,k:false,l:true
        };
    }
}