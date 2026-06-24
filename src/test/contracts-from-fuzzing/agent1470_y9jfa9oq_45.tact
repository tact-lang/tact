struct Singular {
    foo: Int? = 4;
}

contract EmptyInit {
    var: Singular;

    init() {
        self.var = Singular{};
    }
}