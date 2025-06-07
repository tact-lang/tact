struct Mix {
    opt1: Int?;
    req1: Int;
    opt2: String?;
    req2: Bool;
}

contract Test {
    mix: Mix;

    init() {
        self.mix = Mix{ opt1: null, req1: 42, opt2: null, req2: true };
    }
}