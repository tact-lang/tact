struct Tuple {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct Container {
    t1: Tuple;
    t2: Tuple;
    t3: Tuple;
}

contract TestStorage {
    cont: Container;

    init() {
        self.cont = Container{
            t1: Tuple{a:1,b:2,c:3,d:4},
            t2: Tuple{a:5,b:6,c:7,d:8},
            t3: Tuple{a:9,b:10,c:11,d:12}
        };
    }
}