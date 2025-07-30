struct Tuple1 {
    a: Int;
}

struct Tuple2 {
    a: Int;
    b: Int;
}

struct Tuple3 {
    a: Int;
    b: Int;
    c: Int;
}

contract ManySmallStructs {
    t1: Tuple1;
    t2: Tuple2;
    t3: Tuple3;

    init() {
        self.t1 = Tuple1{a:1};
        self.t2 = Tuple2{a:2,b:3};
        self.t3 = Tuple3{a:4,b:5,c:6};
    }
}