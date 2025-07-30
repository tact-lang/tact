struct ManyBools {
    a: Bool; b: Bool; c: Bool; d: Bool; e: Bool;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
}

contract BoolFields {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            a:true,b:false,c:true,d:false,e:true,
            f:true,g:false,h:true,i:false,j:true
        };
    }
}