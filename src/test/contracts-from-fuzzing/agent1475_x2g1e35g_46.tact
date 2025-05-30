// Testing persistent field with deeply nested string inside struct
struct Chain {
    val: String;
}

struct Wrapper {
    nested: Chain;
}

contract DeepString {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: Chain{
                val: "deep",
            }
        };
    }
}