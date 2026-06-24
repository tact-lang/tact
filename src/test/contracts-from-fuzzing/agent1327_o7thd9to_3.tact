struct Deepest {
    value: Int;
}

struct MidOptional {
    deep: Deepest?;
}

struct Outer {
    inner: MidOptional?;
}

contract Test {
    complex: Outer;

    init() {
        self.complex = Outer{ inner: MidOptional{ deep: Deepest{ value: 99 } } };
    }
}