struct Embedded {
    i: Int;
    b: Bool;
}

struct ContainerOpt {
    s: Embedded?;
    j: Int;
}

contract StructOptPersist {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            s: null,
            j: 99,
        };
    }

    receive() {
        self.data = self.data;
    }
}