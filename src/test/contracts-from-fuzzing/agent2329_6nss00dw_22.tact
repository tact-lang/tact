struct Sub {
    x: Int;
}

struct Container {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract StructArraySim {
    cont: Container;

    init() {
        self.cont = Container{
            s1: Sub{ x:1 },
            s2: Sub{ x:2 },
            s3: Sub{ x:3 }
        };
    }
}
