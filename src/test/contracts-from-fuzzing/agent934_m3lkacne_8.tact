struct Nested1 {
    val1: Int;
    val2: Bool;
}

struct Nested2 {
    a: Nested1;
    b: Nested1;
}

struct Nested3 {
    level2: Nested2;
    comment: String;
}

contract DeepHierarchy {
    state: Nested3;

    init() {
        self.state = Nested3{
            level2: Nested2{
                a: Nested1{val1:1,val2:true},
                b: Nested1{val1:2,val2:false},
            },
            comment: "deep",
        };
    }
}