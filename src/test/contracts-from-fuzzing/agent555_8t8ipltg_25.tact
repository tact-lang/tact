struct ExtraLevel {
    deep: Deeper?;
}

struct Deeper {
    foo: Foo;
}

struct Foo {
    x: Int;
    y: Int;
    z: Int;
}

contract NullDeeper {
    opt: ExtraLevel;

    init() {
        self.opt = ExtraLevel{ deep: null };
    }
}