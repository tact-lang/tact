struct NestedOptional {
    x: Int?;
    y: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestStorage {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{
            x: null,
            y: true,
            inner: InnerStruct{
                val: 123,
                flag: false,
            },
        };
    }
}
