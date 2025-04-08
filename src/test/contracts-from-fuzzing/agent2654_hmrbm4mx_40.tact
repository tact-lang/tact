struct Embed {
    a: Int; b: Bool; s: String;
}

contract MultipleAssignments {
    e: Embed;

    init() {
        self.e = Embed{ a:1, b:true, s:"x"};
        self.e = Embed{ a:2, b:false, s:"y"};
    }
}