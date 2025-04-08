struct AA { foo: Int; }
struct BB { bar: AA?; }
struct CC { baz: BB?; }

contract NestedOptChain {
    val: CC?;

    init() {
        self.val = null;
    }
}