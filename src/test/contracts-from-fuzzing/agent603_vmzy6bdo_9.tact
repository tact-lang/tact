struct NestedStruct {
    foo: InnerStruct;
}

struct InnerStruct {
    bar: Int;
    baz: InnerMostStruct;
}

struct InnerMostStruct {
    qux: Bool;
    quux: String;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            foo: InnerStruct{
                bar: 123,
                baz: InnerMostStruct{
                    qux: true,
                    quux: "hello"
                }
            }
        };
    }
}