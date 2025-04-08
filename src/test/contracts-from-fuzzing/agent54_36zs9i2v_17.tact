struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract PackedBits {
    data: ManyBools;

    init() {
        self.data = ManyBools{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false
        };
    }
}