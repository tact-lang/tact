struct Layer3 {
    payload: String;
}

struct Layer2 {
    middle: Layer3;
}

struct Layer1 {
    first: Layer2;
}

contract TripleNesting {
    state: Layer1;

    init() {
        self.state = Layer1{
            first: Layer2{
                middle: Layer3{
                    payload: "hi",
                },
            },
        };
    }
}