// Now deliberately omit nested struct init to test null default
struct Part {
    s: String;
    b: Bool;
}
struct Wrap {
    p: Part?;
}
contract TestContract {
    f: Wrap;

    init() {
        self.f = Wrap { p: null };
    }
}