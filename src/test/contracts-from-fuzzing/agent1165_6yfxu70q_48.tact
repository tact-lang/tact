struct ContainerA {
    a: Int;
}
struct ContainerB {
    b: Int;
}

contract TwoContainers {
    ca: ContainerA;
    cb: ContainerB;

    init() {
        self.ca = ContainerA{ a: 11 };
        self.cb = ContainerB{ b: 22 };
    }
}
