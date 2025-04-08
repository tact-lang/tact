// Optional of struct with default values in persistent storage
struct DefOpt {
    a: Int = 7;
    b: Bool = false;
}

contract TestContract {
    opt: DefOpt?;

    init() {
        self.opt = DefOpt{};
    }
}