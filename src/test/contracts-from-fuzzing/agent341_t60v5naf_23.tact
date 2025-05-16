struct Embed {
    inner_int: Int;
    inner_string: String;
    inner_bool: Bool;
}

contract VarEmbed {
    e1: Embed;
    e2: Embed;

    init() {
        self.e1 = Embed{ inner_int: 1, inner_string: "a", inner_bool: false };
        self.e2 = Embed{ inner_int: 10, inner_string: "b", inner_bool: true };
    }
}