struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    s: String;
    opt: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                a: 10,
                b: true,
                s: "hello",
                opt: null,
            }
        };
    }
}