struct DeepInner {
    val: Int;
    flag: Bool;
}

struct Middle {
    deep: DeepInner;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedStructs {
    stored: Outer = Outer{middle: Middle{deep: DeepInner{val: 5, flag: true}}};

    receive() {
        let _ = self.stored.middle.deep.val;
    }
}