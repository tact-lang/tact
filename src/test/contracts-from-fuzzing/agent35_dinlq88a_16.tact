struct Embedded {
    v1: Int;
    v2: Bool;
    v3: String;
}

struct Container {
    e1: Embedded;
    e2: Embedded;
    e3: Embedded;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            e1: Embedded{ v1: 1, v2:true,  v3:"x" },
            e2: Embedded{ v1: 2, v2:false, v3:"y" },
            e3: Embedded{ v1: 3, v2:true,  v3:"z" }
        };
    }
}