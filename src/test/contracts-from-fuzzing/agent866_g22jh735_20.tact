struct Inner {
    a: Int? as uint8;
    b: Bool;
}

struct Outer {
    i: Inner?;
    s: String;
}

contract NestedSome {
    val: Outer;

    init() {
        self.val = Outer{
            i: Inner{
                a: null,
                b: true
            },
            s: "hi"
        };
    }
}

contract Dummy {receive(){}}