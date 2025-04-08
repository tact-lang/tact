struct DeepOpt {
    inner: Int?;
}

contract DeepOptStruct {
    s: DeepOpt? = null;

    init() {
        self.s = DeepOpt{ inner: 7 };
    }
}