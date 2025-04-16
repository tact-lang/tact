struct WrappedOptional {
    val: Int?;
}

contract TestContract {
    flag: Bool;
    wrap: WrappedOptional;

    init() {
        self.flag = true;
        self.wrap = WrappedOptional{ val: null };
    }
}