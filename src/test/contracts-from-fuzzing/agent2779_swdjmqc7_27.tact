struct Container {
    a: Int;
    b: Bool;
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    s: String;
    x: Int;
}

contract OptionalStructField {
    val: Container;
    init() {
        self.val = Container{
            a: 1,
            b: false,
            innerOpt: null
        };
    }
}