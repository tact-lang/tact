struct AB {
    a: Int;
    b: String;
}

contract TestContract {
    ab: AB;

    init() {
        self.ab = AB{a: 1, b: "hi"};
    }
}