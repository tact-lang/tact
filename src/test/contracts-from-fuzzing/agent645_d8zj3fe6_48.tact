struct Container {
    inner: InnerStruct;
}

struct InnerStruct {
    data: Int?;
}

contract OptHolder {
    cont: Container;

    init() {
        self.cont = Container{
            inner: InnerStruct{data:null}
        };
    }
}
