struct SOptString {
    s: String?;
}

contract OptStringState {
    state: SOptString;

    init() {
        self.state = SOptString{
            s: null
        };
    }
}