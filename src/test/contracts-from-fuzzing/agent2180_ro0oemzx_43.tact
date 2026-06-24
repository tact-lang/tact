struct InnerDefaultsOpt {
    val: Int? = null;
}

contract OptDefaultsImplicit {
    data: InnerDefaultsOpt;

    init() {
        self.data = InnerDefaultsOpt{};
    }
}