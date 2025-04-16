struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    nested1: Inner;
    nested2: Inner;
}

contract MultipleNestedStructs {
    storage: Container;

    init() {
        self.storage = Container{
            nested1: Inner{a:1, b:true, c:"x"},
            nested2: Inner{a:2, b:false, c:"y"}
        };
    }
}