struct Outer {
    num: Int;
    maybeInner: Inner?;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            num: 9,
            maybeInner: Inner{
                flag: true,
                text: "abc"
            }
        };
    }
}