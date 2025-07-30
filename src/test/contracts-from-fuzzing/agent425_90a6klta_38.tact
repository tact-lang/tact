// nested struct assigned via explicit inner creation
struct Inner {
    q: Int;
    r: Bool;
}

struct Outer {
    inner: Inner;
    s: Int;
}

contract TestContract {
    val: Outer;

    init() {
        let myInner: Inner = Inner{ q: 23, r: true };
        self.val = Outer{ inner: myInner, s: 99 };
    }
}