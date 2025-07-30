struct Embed {
    a: Int;
}

contract OptionalSerialized {
    opt: Embed?;

    init() {
       self.opt = null;
    }
}
