// now tricky: struct with a defaulted optional with default non-null
struct Trick {
    a: Int? = 1;
    b: Bool? = true;
}
contract TestContract {
    t: Trick;
    init() {
        self.t = Trick{};
    }
}