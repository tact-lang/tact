struct SomeInner {
    a: Int;
    b: Int?;
    c: Bool;
}

contract MixOptNested {
    val: SomeInner;

    init() {
        self.val = SomeInner {
            a: 50,
            b: null,
            c: true
        };
    }
}
