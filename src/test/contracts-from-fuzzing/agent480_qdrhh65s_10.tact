struct S {
    small: Int as uint8;
    big: Int as int128;
}

struct Outer {
    inner: S;
    flag: Bool;
}

contract NestedSerialization {
    val: Outer;

    init() {
        self.val = Outer{
            inner: S{small: 12, big: 1000},
            flag: true,
        };
    }
}