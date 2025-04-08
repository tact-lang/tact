struct MultiNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Bool;
    y: String;
}

struct Inner2 {
    m: Int;
    n: Bool;
}

contract NestedFields {
    s: MultiNested;
    
    init() {
        self.s = MultiNested{
            a: 7,
            b: Inner1{
                x: false,
                y: "test",
            },
            c: Inner2{
                m: 8,
                n: true,
            },
        };
    }
}
