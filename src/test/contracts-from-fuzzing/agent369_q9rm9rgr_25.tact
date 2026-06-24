struct SInner {
    a: Int;
    b: Bool;
    c: String;
}

struct SOuter {
    x: SInner;
    y: SInner;
    z: SInner;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            x: SInner{a:1,b:true,c:"x"},
            y: SInner{a:2,b:false,c:"y"},
            z: SInner{a:3,b:true,c:"z"}
        };
    }
}