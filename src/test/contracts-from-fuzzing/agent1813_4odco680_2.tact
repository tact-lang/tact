struct InnerMost { x: Int; y: Bool; }

struct Mid { inner: InnerMost; text: String; opt: Int?; }

contract DeepNested {
    data: Mid;

    init() {
        self.data = Mid{ inner: InnerMost{ x: 10, y: true }, text: "abc", opt: null };
    }
}