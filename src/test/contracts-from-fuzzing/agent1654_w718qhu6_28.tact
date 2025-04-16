struct Bools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract PackedBools {
    payload: Bools;

    init() {
        self.payload = Bools{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false
        };
    }
}