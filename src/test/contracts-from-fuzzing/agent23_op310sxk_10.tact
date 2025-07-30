struct OptionalInner {
    value: Int?;
}

struct NestedOptional {
    inner: OptionalInner;
}

contract TestOptionalNested {
    receive() {
        let x = NestedOptional {
            inner: OptionalInner { value: 55 }
        };
        if (x.inner.value != null) {
            dump(x.inner.value);
        } else {
            dump(0);
        }
    }
}
