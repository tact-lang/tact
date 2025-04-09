struct DeepNest {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    inner4: Inner4;
}

struct Inner4 {
    x: Int;
}

contract TestContract {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{ inner1: Inner1{ inner2: Inner2{ inner3: Inner3{ inner4: Inner4{ x: 42 } } } } };
    }
}
