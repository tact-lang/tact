struct Inner {
    f: Int?;
}
struct Middle {
    inn: Inner?;
}
struct Outer {
    mid: Middle?;
}

contract OptOptOpt {
    val: Outer;

    init() {
        self.val = Outer{ mid: null };
    }
}