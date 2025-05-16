struct S1 { s:String; }
struct S2 { s:String; }

struct Container {
    optS1: S1?;
    optS2: S2?;
}

contract OptPairs {
    field: Container;

    init() {
        self.field = Container{
            optS1:null,
            optS2:null,
        };
    }
}
