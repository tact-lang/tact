struct NullableNest {
    child: Nested?;
}

struct Nested {
    val: Int?;
}

contract TestContract {
    entry: NullableNest;

    init() {
        self.entry = NullableNest {
            child: null
        };
    }

    receive() {
        if (self.entry.child != null) {
            let v = self.entry.child!!.val;
            if (v != null) { dump(v!!); }
        }
    }
}
