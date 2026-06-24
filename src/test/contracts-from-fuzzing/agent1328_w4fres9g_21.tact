struct DeeplyOpted {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainerOpt {
    inner: DeeplyOpted?;
    num: Int;
}

contract OptRecursion {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            inner: null,
            num: 999
        };
    }
}
