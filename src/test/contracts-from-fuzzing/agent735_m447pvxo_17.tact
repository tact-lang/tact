struct TextPair {
    a: String;
    b: String;
}

contract Strings {
    t: TextPair;
    init() {
        self.t = TextPair{a:"first",b:"second"};
    }
}