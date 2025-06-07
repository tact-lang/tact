struct OptFields {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct ContainerWrap {
    first: OptFields;
    optInner: OptFields?;
}

contract CombineOptionals {
    payload: ContainerWrap;
    init() {
        self.payload = ContainerWrap{
            first: OptFields{
                a:null, b:null, c:null,
            },
            optInner: null,
        };
    }
}