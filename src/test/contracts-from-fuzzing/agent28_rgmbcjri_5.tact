struct Inner {
    Value: Int;
}

struct Outer {
    Inner: Inner;
    Extra: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer { Inner: Inner { Value: 42 }, Extra: 100 };
        dump(o.Inner.Value);
    }
}
