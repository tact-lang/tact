struct NestedStringOptional {
    s: String?;
    i: InnerStruct?;
}

struct InnerStruct {
    s: String?;
    j: Inner2?;
}

struct Inner2 {
    s: String?;
}

contract StorageTest {
    data: NestedStringOptional;

    init() {
        self.data = NestedStringOptional{
            s: null,
            i: InnerStruct{
                s: null,
                j: Inner2{
                    s: null
                }
            }
        };
    }
}