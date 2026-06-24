struct Container {
    inner: InnerStruct;
}

struct InnerStruct {
    optInt: Int?;
    str: String;
}

contract OptionalDeepStruct {
    cont: Container;
    init() {
        self.cont = Container{
            inner: InnerStruct{
                optInt: null,
                str: "zzz"
            }
        };
    }
}