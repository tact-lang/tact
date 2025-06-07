struct SInner {
    n: Int;
    b: Bool;
    t: String;
}

struct SMid {
    inner: SInner;
    b: Bool;
    t: String;
}

struct SOuter {
    mid1: SMid;
    mid2: SMid;
    mid3: SMid;
}

contract WideNesting {
    storage: SOuter;

    init() {
        self.storage = SOuter{
            mid1: SMid{inner: SInner{n:1,b:true,t:"1"}, b:true, t:"x"},
            mid2: SMid{inner: SInner{n:2,b:false,t:"2"}, b:false,t:"y"},
            mid3: SMid{inner: SInner{n:3,b:true,t:"3"}, b:true,t:"z"},
        };
    }
}
