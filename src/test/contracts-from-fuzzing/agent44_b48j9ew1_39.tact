struct One {
    b: Bool;
}

struct Two {
    o: One;
}

struct Three {
    t: Two;
}

contract DeepChain {
    data: Three;

    init() {
        self.data = Three{ t: Two{ o: One{ b: true } } };
    }

    receive() {
        let _ = self.data.t.o.b;
    }
}