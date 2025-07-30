struct Small1 {
    a: Int;
}
struct Small2 {
    a: Int;
}
struct Small3 {
    a: Int;
}
struct Small4 {
    a: Int;
}
struct Small5 {
    a: Int;
}
struct Container {
    s1: Small1;
    s2: Small2;
    s3: Small3;
    s4: Small4;
    s5: Small5;
}

contract ManySmallStructs {
    data: Container;

    init() {
        self.data = Container{
            s1: Small1{a:1},
            s2: Small2{a:2},
            s3: Small3{a:3},
            s4: Small4{a:4},
            s5: Small5{a:5}
        };
    }
}