struct WideNested {
    f1: Int; f2: Int; f3: Int; 
    f4: Int; f5: Int; f6: Int;
}

struct Container {
    nested: WideNested;
    suffix: Int;
}

contract NestedFieldFlood {
    data: Container;
    init() {
        self.data = Container{
            nested: WideNested{ f1:1,f2:2,f3:3,f4:4,f5:5,f6:6 },
            suffix: 7
        };
    }
}