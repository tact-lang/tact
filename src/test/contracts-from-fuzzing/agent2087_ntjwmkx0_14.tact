struct Middle1 {
    v1: Int;
    v2: Bool?;
}

struct Middle2 {
    v3: Bool;
    nested: Middle1;
}

struct Root {
    inner1: Middle2;
    inner2: Middle2;
}

contract CompoundOptions {
    field: Root;

    init() {
        self.field = Root{
            inner1: Middle2{v3:true,nested:Middle1{v1:1,v2:null}},
            inner2: Middle2{v3:false,nested:Middle1{v1:2,v2:true}}
        };
    }
}