struct WithTrailing {
    a: Int;
    b: Bool;
    c: String;
}

contract TrailingComma {
    x: WithTrailing;
    init() {
        self.x = WithTrailing{
            a:5,
            b:true,
            c:"x",
        };
    }
}