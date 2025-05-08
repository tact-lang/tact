struct TwoStructs {
    a: StructA;
    b: StructB;
}

struct StructA {
    v: Int;
}

struct StructB {
    v: String;
}

contract TwoStructContract {
    data: TwoStructs;

    init() {
        self.data = TwoStructs{
            a: StructA{ v: 123 },
            b: StructB{ v: "hi" }
        };
    }
}