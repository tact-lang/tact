struct D1 {
    intVal: Int;
    optBool: Bool?;
}

struct D2 {
    d1: D1;
    flag: Bool;
    text: String;
}

struct D3 {
    d2: D2;
    quantity: Int;
    note: String?;
}

contract TestDeep {
    data: D3;
    
    init() {
        self.data = D3{
            d2: D2{
                d1: D1{ intVal: 7, optBool: null },
                flag: true,
                text: "hello",
            },
            quantity: 42,
            note: null,
        };
    }
}
