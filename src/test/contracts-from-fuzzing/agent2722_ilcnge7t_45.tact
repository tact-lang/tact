// test contract with multiple layers of nested structs

struct Layer3 {
    leaf: Int;
    flag: Bool;
}

struct Layer2 {
    l3: Layer3;
    text: String;
}

struct Layer1 {
    l2: Layer2;
    value: Int;
}

contract MultiLayer {
    data: Layer1;

    init() {
        self.data = Layer1 {
            l2: Layer2 {
                l3: Layer3 {
                    leaf: 3,
                    flag: true
                },
                text: "hello"
            },
            value: 42
        };
    }
}
