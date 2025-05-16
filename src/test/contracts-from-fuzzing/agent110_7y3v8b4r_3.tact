struct InnerStruct {
    flag: Bool;
    count: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    message: String;
}

contract DeepNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{flag: true, count: 5},
            message: "hi"
        };
    }
}