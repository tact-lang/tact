struct EmbedsOptional {
    b: Inner?;
}

struct Inner {
    val: Bool;
}

contract StorageWithEmbeddedOptional {
    data: EmbedsOptional;
    init() {
        self.data = EmbedsOptional{b: null};
    }
}