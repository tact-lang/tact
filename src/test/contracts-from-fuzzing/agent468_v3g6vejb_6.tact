struct NestedMany {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct Outer {
    a: NestedMany;
    b: NestedMany;
    c: NestedMany;
}

contract TestContract {
    nn: Outer;

    init() {
        self.nn = Outer{
            a: NestedMany{ inner1:1, inner2:true, inner3:"x" },
            b: NestedMany{ inner1:2, inner2:false, inner3:"y" },
            c: NestedMany{ inner1:3, inner2:true, inner3:"z" }
        };
    }
}