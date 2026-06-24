struct Child {
    x: Int;
    y: Bool;
    z: String;
}

struct Container {
    child1: Child;
    child2: Child;
    flag: Bool;
}

contract ManyChilds {
    data: Container;

    init() {
        self.data = Container{
            child1: Child{x:1,y:true,z:"a"},
            child2: Child{x:2,y:false,z:"b"},
            flag: true,
        };
    }
}