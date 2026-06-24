struct EmbeddedString {
    s: String;
}

struct UpLayer {
    node: EmbeddedString;
}

contract StringChain {
    content: UpLayer;

    init() {
        self.content = UpLayer{
            node: EmbeddedString{
                s: "hey"
            }
        };
    }
}
