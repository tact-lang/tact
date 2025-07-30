struct HasStrDef {
    s: String = "default";
}

contract StringDefaultField {
    d: HasStrDef;

    init() {
        self.d = HasStrDef{};
    }
}