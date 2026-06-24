struct Wrap {
    s: String;
    i: Int as int16;
    b: Bool;
}

contract WrapTest {
    w: Wrap;

    init() {
        self.w = Wrap{ s:"hello", i:42, b:true };
    }
}