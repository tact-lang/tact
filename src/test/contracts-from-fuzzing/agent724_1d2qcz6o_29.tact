struct DefSerOpt {
    a: Int? as uint8 = null;
    b: Int? as int64 = null;
}

contract TestContract {
    val: DefSerOpt;

    init() {
        self.val = DefSerOpt{};
    }
}