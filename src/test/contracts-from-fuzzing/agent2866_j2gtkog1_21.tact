// deeply nested optional structs (version with optional at root)

struct DeepOpt {
    inner1: Inner1?;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    inner3: Inner3?;
}

struct Inner3 {
    num: Int;
}

contract DeepOptionals {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{inner1: null};
    }

    receive() {}
}