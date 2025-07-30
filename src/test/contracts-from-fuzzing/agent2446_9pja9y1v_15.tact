struct Inner1 { f: Int; }
struct Inner2 { f: Inner1; }

contract OptDeepField {
    val: Inner2?;

    init() {
        self.val = null;
    }
}