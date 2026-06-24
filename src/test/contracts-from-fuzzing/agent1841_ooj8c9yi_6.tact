struct InnerStruct {
    foo: Int;
}

struct Container {
    nestedOpt: InnerStruct?;
    directOpt: Int?;
}

contract OptFieldTest {
    val: Container;

    init() {
        self.val = Container{
            nestedOpt: InnerStruct{foo: 5},
            directOpt: null
        };
    }
}
