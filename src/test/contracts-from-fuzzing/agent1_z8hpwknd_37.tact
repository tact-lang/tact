struct InnerOpt {
    val: Int?;
}

contract OptStructDefaulted {
    optStruct: InnerOpt? = null;

    init() {
        self.optStruct = null;
    }
}