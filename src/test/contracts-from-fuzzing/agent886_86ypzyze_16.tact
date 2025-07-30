struct WithString {
    s: String;
    optS: String?;
}

contract TestContract {
    data: WithString;
    init() {
        self.data = WithString{s:"foo", optS: null};
    }
}