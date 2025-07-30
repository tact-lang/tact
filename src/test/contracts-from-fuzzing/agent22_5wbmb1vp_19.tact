struct Layer1 {
    field1: Int;
    field2: Layer2;
}

struct Layer2 {
    foo: Int;
    bar: Layer3;
}

struct Layer3 {
    baz: Int;
    qux: Layer4;
}

struct Layer4 {
    deepVal: Int;
}

contract TestContract {
    deep: Layer1;

    init() {
        self.deep = Layer1{
            field1:1,
            field2:Layer2{
                foo:2,
                bar:Layer3{
                    baz:3,
                    qux:Layer4{deepVal:4}
                }
            }
        };
    }
}