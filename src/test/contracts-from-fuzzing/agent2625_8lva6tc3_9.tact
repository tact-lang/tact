struct Embed {
    text: String;
    valid: Bool;
}

struct Container {
    e1: Embed;
    e2: Embed;
    e3: Embed;
}

contract EmbeddedStructs {
    c: Container;
    
    init() {
        self.c = Container{
            e1: Embed{ text: "x", valid: true },
            e2: Embed{ text: "y", valid: false },
            e3: Embed{ text: "z", valid: true }
        };
    }
}
