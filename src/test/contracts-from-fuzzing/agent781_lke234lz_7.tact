struct Inner {
    flag: Bool = true;
    amount: Int?;
    note: String = "note";
}

struct Outer {
    some: Inner;
    other: Inner?; 
}

contract NullableNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            some: Inner{ flag: false, amount: null, note: "abc" },
            other: null,
        };
    }
}