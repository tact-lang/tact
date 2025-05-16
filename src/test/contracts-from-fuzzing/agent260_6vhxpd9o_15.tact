struct TinyOpt {
    val: Int as uint4;
}

contract OptTinyNested {
    data: TinyOpt?;

    init() {
        self.data = null;
    }
}