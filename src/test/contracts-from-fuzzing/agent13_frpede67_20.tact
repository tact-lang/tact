// opt of struct with optional primitive inside
struct HasOpt { foo: Int?; bar: Bool; }

contract TestContract {
    sopt: HasOpt?;
    init() {
        self.sopt = null;
    }
}