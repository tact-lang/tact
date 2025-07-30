struct NestedStructA {
    a: Int;
    b: Bool?;
    c: String;
}

struct NestedStructB {
    nsA: NestedStructA; 
    x: Int?;
    y: Bool;
    s: String?;
}

contract TestDeepNested {
    data: NestedStructB;

    init() {
        self.data = NestedStructB{
            nsA: NestedStructA{
                a: 10,
                b: null,
                c: "hi"
            },
            x: null,
            y: true,
            s: null
        };
    }
}