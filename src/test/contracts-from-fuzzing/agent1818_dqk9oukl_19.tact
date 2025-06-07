struct Inner {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{f1:1,f2:true,f3:"a"},
            nested2: Inner{f1:2,f2:false,f3:"b"},
            nested3: Inner{f1:3,f2:true,f3:"c"}
        };
    }
}
