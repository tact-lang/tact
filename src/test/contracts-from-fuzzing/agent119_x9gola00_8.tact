struct InnerMost {
    x: Int;
}

struct Inner {
    a: Int;
    b: InnerMost;
}

struct Middle {
    arr1: Inner;
    arr2: Inner;
}

struct Outer {
    level: Int;
    deep: Middle;
}

contract TestContract {
    deepField: Outer;

    init() {
        self.deepField = Outer{
            level: 10,
            deep: Middle{
                arr1: Inner{a: 1, b: InnerMost{x:2}},
                arr2: Inner{a:3, b: InnerMost{x:4}}
            }
        };
    }

    receive() {
        let df = self.deepField;
    }
}