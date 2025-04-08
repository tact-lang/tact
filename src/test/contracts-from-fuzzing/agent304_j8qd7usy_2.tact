struct DeepNested { sub: Inner; }
struct Inner { val: Int; }

contract Test {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{sub: Inner{val: 10}};
    }
}