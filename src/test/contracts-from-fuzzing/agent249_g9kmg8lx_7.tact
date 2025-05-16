struct Inner {
    val: Int;
}

struct Outer {
    core: Inner?;
    flag: Bool;
}

contract NestedOptionalStructField {
    data: Outer;

    init() {
        self.data = Outer{
            core: Inner{ val: 99 },
            flag: true
        };
    }

    receive() {
        if (self.data.core != null) {
            let _ = self.data.core!!.val;
        }
    }
}