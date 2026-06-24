struct DeepInner { x: Int?; }
struct Inner { foo: DeepInner; }

contract TestContract {
    bar: Inner;

    init() {
        self.bar = Inner{ foo: DeepInner{ x: null } };
    }
}