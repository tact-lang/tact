struct Outer {
    inner: Middle;
}

struct Middle {
    deep: InnerMost;
}

struct InnerMost {
    foo: Int;
}

contract TestContract {
    val: Outer = Outer{
        inner: Middle{
            deep: InnerMost{ foo: 5 }
        }
    };

    init() {
        self.val = Outer{
            inner: Middle{
                deep: InnerMost{ foo: 777 }
            }
        };
    }
}