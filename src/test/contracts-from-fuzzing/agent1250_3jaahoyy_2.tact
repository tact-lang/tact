struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    n: Nested;
    flag: Bool;
}

contract TestContract {
    o: Outer = Outer{n: Nested{x:1,y:true}, flag: false};

    init() {
        self.o = Outer{n: Nested{x:2,y:false}, flag:true};
    }
}