struct NestedDeepDefault {
    a: Int = 123;
    b: Bool = true;
}

struct DeepOuter {
    c: NestedDeepDefault = NestedDeepDefault{};
    d: Int = 7;
}

contract DeepDefaultChain {
    val: DeepOuter = DeepOuter{};
    receive() {
        let _ = self.val.c.b;
    }
}