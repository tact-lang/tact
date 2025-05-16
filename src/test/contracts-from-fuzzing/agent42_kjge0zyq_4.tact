struct OptWrap {
    value: Int?;
}

contract OptInOpt {
    data: OptWrap? = null;

    init() {
        self.data = OptWrap{ value: null };
    }
}