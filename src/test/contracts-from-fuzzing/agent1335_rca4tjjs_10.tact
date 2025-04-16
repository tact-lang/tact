struct Lower {
    val: Int;
}

struct Upper {
    maybeInner: Lower?;
    flag: Bool;
}

contract NestedOptImplicit {
    data: Upper;
    init() {
        self.data = Upper{
            flag: false,
        };
    }
    receive() {}
}