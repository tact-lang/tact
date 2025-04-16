struct SubStruct {
    s1: String;
    i1: Int;
}

contract OptionalStructTest {
    opt: SubStruct?;

    init() {
        self.opt = null;
    }
}
