struct OptionNullable {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct ComplexStruct {
    x: Int;
    y: OptionNullable;
}

contract ComplexOptional {
    val: ComplexStruct;

    init() {
        self.val = ComplexStruct{
            x: 5,
            y: OptionNullable{
                a: null, b: null, c: null, d: null, e: null, f: null
            }
        };
    }
}