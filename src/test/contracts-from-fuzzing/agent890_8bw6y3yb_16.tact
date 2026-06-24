struct Embed {
    b: Bool; 
    s: String;
}

struct Wrapped {
    embed: Embed;
    optEmbed: Embed?;
    text: String;
}

contract Test {
    a: Int;
    w: Wrapped;

    init() {
        self.a = 1;
        self.w = Wrapped{
            embed: Embed{ b:true, s:"hi" },
            optEmbed: null,
            text: "hello"
        };
    }
}