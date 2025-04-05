struct Inner2 {
    a: Int;
}

struct Middle2 {
    inner: Inner2?;
}

struct Outer2 {
    middle: Middle2?;
}

contract TestContract {
    receive() {
        let o = Outer2 {
            middle: Middle2 { inner: Inner2 { a: 555 } }
        };
    }
}
