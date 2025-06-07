struct Middle {
    foo: Int;
    bar: Int;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
}

contract NestedRepeated {
    val: Outer;

    init() {
        self.val = Outer{
            middle1: Middle{foo:1, bar:2},
            middle2: Middle{foo:3, bar:4}
        };
    }
}