struct InnerX {
    x: Int;
    y: Bool?;
}

struct OuterX {
    inner1: InnerX;
    inner2: InnerX;
    inner3: InnerX;
}

contract NestedOptionals3 {
    payload: OuterX;

    init() {
        self.payload = OuterX{
            inner1: InnerX{x:1,y:null},
            inner2: InnerX{x:2,y:null},
            inner3: InnerX{x:3,y:null}
        };
    }

    receive() {
        self.payload = OuterX{
            inner1: InnerX{x:10,y:true},
            inner2: InnerX{x:20,y:false},
            inner3: InnerX{x:30,y:true}
        };
    }
}