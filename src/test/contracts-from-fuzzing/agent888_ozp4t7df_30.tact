struct Data1 { a: Int; }
struct Data2 { b: String; }

struct MultiNested {
    first: Data1;
    second: Data2;
}

contract MultiNesting {
    nested: MultiNested;

    init() {
        self.nested = MultiNested{
            first: Data1{a:42},
            second: Data2{b:"hello"},
        };
    }
}