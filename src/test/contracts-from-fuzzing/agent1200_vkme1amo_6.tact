struct ComplexNested {
    x: Int;
    y: Int?;
    s: String;
    flag: Bool;
}

struct Outer {
    nested1: ComplexNested;
    nested2: ComplexNested?;
    count: Int;
    note: String?;
}

contract ComplexNestedFields {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: ComplexNested{
                x:1, y:null, s:"a", flag:true
            },
            nested2: null,
            count: 5,
            note: "notes"
        };
    }
}