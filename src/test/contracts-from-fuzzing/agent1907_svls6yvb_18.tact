struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

struct ContainerOpt {
    nested: NestedOpt?;
    s: String;
}

contract ContractNestedOpt {
    conf: ContainerOpt;

    init() {
        self.conf = ContainerOpt{
            nested: null,
            s: "hello"
        };
    }
}