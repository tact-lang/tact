struct A { x:Int; }

contract OptionalUnset {
    opt: A?;

    init() {
        self.opt = null;
    }
}