struct Strange {
    a: Int?;
    b: Int? = null;
}

contract StrangeTest {
    opt: Strange?;
    init() {
        self.opt = null;
    }
}