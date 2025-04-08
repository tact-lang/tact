// Nested struct instantiated with optional omitted, replaced by default

struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Middle {
    inner: Inner;
    txt: String = "abc";
}

contract TestContract {
    val: Middle;

    init() {
        self.val = Middle{
            inner: Inner{foo:42, bar:null}
        };
    }
}