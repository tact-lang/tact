struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
}

struct Chain3 {
    intVal: Int;
}

contract ChainNested {
    head: Chain1;

    init() {
        self.head = Chain1{ next: Chain2{ next: Chain3{ intVal: 123 } } };
    }
}