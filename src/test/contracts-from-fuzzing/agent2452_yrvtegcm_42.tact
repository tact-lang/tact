struct DefaultOpt {
    val: Int? = null;
}

contract DefaultOptStruct {
    d: DefaultOpt = DefaultOpt{};
    init() {
        self.d = DefaultOpt{};
    }
}