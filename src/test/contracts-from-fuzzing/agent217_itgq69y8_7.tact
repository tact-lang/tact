struct SubA {
    foo: Int;
    bar: Bool;
}

struct SubB {
    baz: String;
    qux: Int;
}

struct Top {
    sa: SubA;
    sb: SubB;
}

contract MultiNestedFields {
    all: Top;

    init() {
        self.all = Top{
            sa: SubA{foo: 1, bar: true},
            sb: SubB{baz: "xyz", qux: 42},
        };
    }
}