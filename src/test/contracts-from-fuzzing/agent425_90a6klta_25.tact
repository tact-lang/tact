// reuse of struct inside itself is invalid (circular), skip that known issue

struct Sub {
    x: Int;
    y: Bool;
}

contract OptFields {
    sub: Sub?;
    init() {
        self.sub = null;
    }
}