struct DeepNest { inner: Inner }

struct Inner { value: Bool }

contract TestContract {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{ inner: Inner{ value: false } };
    }
}