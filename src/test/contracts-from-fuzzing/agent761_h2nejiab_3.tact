struct Layer1 {
    a: Int;
}

struct Layer2 {
    inner: Layer1;
    b: Bool;
}

struct Layer3 {
    nested: Layer2;
    c: String;
    flag: Bool?;
}

contract DeepNestedContract {
    data: Layer3;

    init() {
        self.data = Layer3{
            nested: Layer2{
                inner: Layer1{a: 7},
                b: false
            },
            c: "hello",
            flag: true
        };
    }
}
