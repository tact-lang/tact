struct RecTail {
    x: Int;
}

// Tail position optional
struct OptionalTail {
    head: Int;
    tail: RecTail?;
}

contract OptionTailContract {
    data: OptionalTail;

    init() {
        self.data = OptionalTail{head:1, tail:null};
    }
}