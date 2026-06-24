struct DeepInner {
    value: Int;
}

struct DeepMiddle {
    inner: DeepInner?;
}

struct DeepOuter {
    middle: DeepMiddle?;
}

contract TestDeepNestedOptionals {
    receive() {
        // Instantiate DeepOuter with all nested optionals filled
        let instance: DeepOuter = DeepOuter {
            middle: DeepMiddle { inner: DeepInner { value: 42 } }
        };
    }
}
