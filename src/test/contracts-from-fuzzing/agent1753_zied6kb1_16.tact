struct Embed {
    s: Inner;
}

struct Inner {
    s2: Base;
}

struct Base {
    n: Int;
}

contract DeepEmbed {
    value: Embed;

    init() {
        self.value = Embed{
            s: Inner{
                s2: Base{
                    n: 42
                }
            }
        };
    }
}