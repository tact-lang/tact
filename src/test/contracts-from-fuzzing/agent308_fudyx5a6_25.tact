struct OptionalMany {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionals {
    state: OptionalMany;

    init() {
        self.state = OptionalMany{
            a:null, b:null, c:null
        };
    }
}
