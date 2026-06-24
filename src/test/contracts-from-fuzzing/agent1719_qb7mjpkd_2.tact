struct Nested2 {
    z: Int?;
    remark: String;
}

struct Nested1 {
    inner: Nested2;
    name: String;
}

contract StorageNested {
    field: Nested1;

    init() {
        self.field = Nested1{
            inner: Nested2{
                z: null,
                remark: "deep"
            },
            name: "top"
        };
    }
}