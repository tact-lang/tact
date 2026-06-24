// Optional struct itself
struct MaybeIt {
    val: Int
}

contract OuterOptStruct {
    inner: MaybeIt?;

    init() {
        self.inner = null;
    }
}