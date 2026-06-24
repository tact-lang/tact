struct EmptyDefaultOpt {
    foo: Int? = null;
}

contract OptDefaultStruct {
    val: EmptyDefaultOpt;

    init() {
        self.val = EmptyDefaultOpt{};
    }
}