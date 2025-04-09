struct Left {
    x: Int;
}
struct Right {
    y: Int;
}

struct Embed {
    l: Left;
    r: Right;
}

contract EmbedStructs {
    val: Embed;

    init() {
        self.val = Embed{
            l: Left{ x:1 },
            r: Right{ y:2 }
        };
    }
}