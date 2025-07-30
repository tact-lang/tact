struct OptDefaultNonNull {
    val: Int? = 77;
}

contract Test16 {
    d: OptDefaultNonNull;

    init() {
        self.d = OptDefaultNonNull{};
    }

    receive() {}
}