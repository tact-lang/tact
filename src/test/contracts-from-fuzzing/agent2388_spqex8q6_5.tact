struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner1: NestedOptional;
    inner2: NestedOptional;
}

contract ManyNestedOptional {
    data: Container;

    init() {
        self.data = Container{
            inner1: NestedOptional{a:null, b:true, c:"x"},
            inner2: NestedOptional{a:5, b:null, c:null}
        };
    }
}