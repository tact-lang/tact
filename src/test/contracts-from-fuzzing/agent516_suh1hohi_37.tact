struct ComplexStack {
    a: Int?;
    b: Bool;
    c: Address?;
    d: String;
    e: Bool?;
    f: Int;
}

contract Complexity {
    field: ComplexStack;

    init() {
        self.field = ComplexStack{
            a: null,
            b: false,
            c: null,
            d: "stack",
            e: null,
            f: 123
        };
    }
}
