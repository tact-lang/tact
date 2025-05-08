struct OptionalDeep {
    maybeDeep: Deep1?;
}

struct Deep3 { f: Int; }
struct Deep2 { inner: Deep3; }
struct Deep1 { inner: Deep2; }

contract OptDeepTest {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{ maybeDeep: null };
    }
}