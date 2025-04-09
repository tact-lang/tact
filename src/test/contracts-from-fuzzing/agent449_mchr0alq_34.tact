message(7) SimpleMsg { x: Int }

struct Outer {
    inner: SimpleMsg?;
}

contract NestedOptionalMsg {
    val: Outer;

    init() {
        self.val = Outer{ inner: SimpleMsg{ x: 5 } };
    }
}
