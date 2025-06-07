struct InnerOptional {
    a: Int?;
    b: String?;
}

struct Wrap {
    x: InnerOptional?;
}

contract TestContract {
    val: Wrap;

    init() {
        self.val = Wrap{ x: null };
    }
}