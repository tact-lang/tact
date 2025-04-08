// Struct with deeply nested 'remaining' suffix usage
struct Suffix {
    suffix: Slice as remaining;
}

struct Wrapper {
    x: Int;
    content: Suffix;
}

contract DeepRemaining {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            x: 5,
            content: Suffix{
                suffix: emptyCell().asSlice()
            }
        };
    }
}
