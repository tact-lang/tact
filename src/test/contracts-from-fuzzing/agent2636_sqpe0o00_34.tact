struct SimpleOptional {
    f: Int?;
}

struct OuterStruct {
    inner: SimpleOptional;
}

contract NestedOpt2 {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: SimpleOptional{ f: null },
        };
    }
}