struct Defaulted {
    x: Int = 7;
    flag: Bool = true;
}

contract TestContract {
    maybe: Defaulted?;

    init() {
        self.maybe = null;
    }
}