struct Layer1 {
    foo: Int;
    bar: String?;
}

struct Layer2 {
    inner: Layer1;
    flag: Bool;
}

struct Layer3 {
    middle: Layer2;
    note: String;
}

contract DeepNestOption {
    state: Layer3;

    init() {
        self.state = Layer3{
            middle: Layer2{
                inner: Layer1{
                    foo: 88,
                    bar: null
                },
                flag: true
            },
            note: "deep"
        };
    }
}