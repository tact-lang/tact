struct Wrap {
    i: Int;
}

contract OptionalStruct {
    opt: Wrap? = null;
    receive() {
        let _ = self.opt;
    }
}