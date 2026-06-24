// test many optional nested struct fields at once
struct Nested1 { x: Int; }
struct Nested2 { y: Bool; }
struct Nested3 { z: String; }

struct OptNestWrap {
    n1: Nested1?;
    n2: Nested2?;
    n3: Nested3?;
}

contract TestManyOptNested {
    data: OptNestWrap = OptNestWrap{n1:null, n2:null, n3:null};

    init() {
        self.data = OptNestWrap{
            n1: Nested1{x:11},
            n2: Nested2{y:true},
            n3: Nested3{z:"abc"}
        };
    }
}
