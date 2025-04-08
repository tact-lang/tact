struct MultiNested {
    a: Int;
    b: Bool;
}

struct Container {
    f1: MultiNested;
    f2: MultiNested;
    f3: MultiNested;
    f4: MultiNested;
    f5: MultiNested;
}

contract MultiNestedFields {
    data: Container;

    init() {
        self.data = Container{
            f1: MultiNested{a:1,b:true},
            f2: MultiNested{a:2,b:false},
            f3: MultiNested{a:3,b:true},
            f4: MultiNested{a:4,b:false},
            f5: MultiNested{a:5,b:true}
        };
    }
}
