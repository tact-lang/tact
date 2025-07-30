struct BoolFlags {
    a: Bool; b: Bool; c: Bool; d: Bool;
    e: Bool; f: Bool; g: Bool; h: Bool;
    i: Bool; j: Bool; k: Bool; l: Bool;
}

contract BitsInStorage {
    flags: BoolFlags;
    init() {
        self.flags = BoolFlags{
            a:true,b:false,c:true,d:false,
            e:true,f:true,g:false,h:false,
            i:true,j:true,k:false,l:true
        };
    }
}