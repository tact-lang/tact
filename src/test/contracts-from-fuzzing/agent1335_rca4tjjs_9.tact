struct Lower {
    val: Int;
}

struct Upper {
    maybeInner: Lower?;
    flag: Bool;
}

contract NestedOpt {
    data: Upper;
    init() {
        self.data = Upper{
            maybeInner: null,
            flag: true,
        };
    }
    receive() {}
}