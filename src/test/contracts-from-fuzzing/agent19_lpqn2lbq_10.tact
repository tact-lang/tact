struct NestedOptionals {
    x: Int?;
    y: Bool?;
}

struct Container {
    n1: NestedOptionals;
    n2: NestedOptionals;
    n3: NestedOptionals;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            n1: NestedOptionals{x:null,y:true},
            n2: NestedOptionals{x:123,y:null},
            n3: NestedOptionals{x:null,y:null},
        };
    }
}