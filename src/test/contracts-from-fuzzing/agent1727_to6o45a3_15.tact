// Test deep nested optionals in structs inside optional field
struct InnerMost {
    x: Int?;
    y: Bool?;
}

struct Wrapper {
    val: InnerMost?;
    s: String?;
}

contract OptionalDeepChain {
    data: Wrapper?;

    receive() {
        self.data = Wrapper{
            val: InnerMost{x: 5, y: null},
            s: null,
        };
    }
}