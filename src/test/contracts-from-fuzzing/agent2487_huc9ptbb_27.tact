struct ManyNested {
    sub1: Inner;
    sub2: Inner;
}

struct Inner {
    f1: Int;
    f2: Bool?;
    f3: String;
}

contract TestContract {
    many: ManyNested;

    init() {
        self.many = ManyNested{
            sub1: Inner{ f1:1,f2:null,f3:"a" },
            sub2: Inner{ f1:2,f2:true,f3:"b" }
        };
    }
}