struct OptionWrapped {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptionWrapping {
    ow: OptionWrapped;

    init() {
        self.ow = OptionWrapped{ inner: null };
    }
}