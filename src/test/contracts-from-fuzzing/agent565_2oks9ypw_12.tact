struct NestedManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

struct Container {
    first: NestedManyFields;
    second: NestedManyFields;
    third: NestedManyFields;
}

contract TestContract {
    all: Container;

    init() {
        self.all = Container{
            first: NestedManyFields{
                a: 1, b: "b", c: true, d: null, e: null, f: null
            },
            second: NestedManyFields{
                a: 2, b: "bb", c: false, d: null, e: null, f: null
            },
            third: NestedManyFields{
                a: 3, b: "bbb", c: true, d: null, e: null, f: null
            }
        };
    }
}