struct Inner {
    str: String?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    record: Outer? = null;

    receive() {
        if (self.record != null && self.record!! .nested != null) {
            let _ = self.record!! .nested!! .str;
        }
    }
}