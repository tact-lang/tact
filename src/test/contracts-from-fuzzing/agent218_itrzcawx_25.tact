struct DefaultMix {
    a: Int = 1;
    b: Bool;
    c: String = "x";
}

contract DefaultsAndNot {
    val: DefaultMix;

    init() {
        self.val = DefaultMix{ b: true };
    }
}