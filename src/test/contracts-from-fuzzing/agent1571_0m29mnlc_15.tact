message(101) NestedMsg {
    val: Int?;
}

contract TestContract {
    mopt: NestedMsg? = null;

    init() {
        self.mopt = NestedMsg{
            val: 999
        };
    }
}