contract LargeMix(
    nest1: Outer?,
    nest2: Outer?,
    plain: Int?,
    txt: String,
    flag: Bool
) {
    receive() {}
}

struct Outer {
    val: Int;
    nested: Inner;
}

struct Inner {
    s: String?
}