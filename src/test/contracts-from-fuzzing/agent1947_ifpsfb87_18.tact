struct Inner {
    i: Int;
}

contract OptFieldStructOpt {
    field: Inner?;
    init() {
        self.field = null;
    }
}