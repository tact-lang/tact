struct OptionalInner {
    v: Int
}

struct OptionalOuter {
    opt: OptionalInner?;
    x: Int
}

contract TestOptionalSerialize {
    receive() {
         dump(OptionalOuter { opt: OptionalInner { v: 99 }, x: 1 }.toCell());
    }
}
