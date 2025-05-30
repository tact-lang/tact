struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    inner: InnerStruct?;
    flag: Bool?;
    count: Int?;
}

contract OptNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: null,
            flag: null,
            count: null
        };
    }
}