struct SubLevel {
    foo: Int?;
    bar: String;
}

struct TopLevel {
    a: Int;
    b: Bool;
    c: SubLevel;
}

contract ManyNestedFields {
    state: TopLevel;

    init() {
        self.state = TopLevel{
            a: 1,
            b: true,
            c: SubLevel{ foo: null, bar: "z" }
        };
    }
}