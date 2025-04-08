struct Opts {
    s: String? = null;
    flag: Bool? = null;
    count: Int? = null;
}

contract OnlyNulls {
    state: Opts;

    init() {
        self.state = Opts{
            s: null,
            flag: null,
            count: null
        };
    }

    receive() {
        if (self.state.flag != null) {
            let _ = self.state.count!!;
        }
    }
}