struct Layer3 {
    foo: String?;
    bar: Bool;
}

struct Layer2 {
    inner: Layer3?;
    count: Int;
}

struct Layer1 {
    data: Layer2?;
    tag: Int;
}

contract MixOptionNest {
    nested: Layer1?;

    init() {
        self.nested = Layer1{
            data: Layer2{
                inner: Layer3{
                    foo: null,
                    bar: true
                },
                count: 7
            },
            tag: 5
        };
    }
}