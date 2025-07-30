struct Outer {
    a: Int;
    b: Int;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int;
    z: Int;
}

contract NestedMultiFieldContract {
    data: Outer;

    init() {
        self.data = Outer{
            a:1,
            b:2,
            c: InnerStruct{
                x:10,
                y:20,
                z:30
            }
        };
    }
}