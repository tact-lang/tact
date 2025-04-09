struct BigOptional {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract ManyOptionals {
    state: BigOptional;

    init() {
        self.state = BigOptional{
            s: null,
            i: null,
            b: null
        };
    }
}