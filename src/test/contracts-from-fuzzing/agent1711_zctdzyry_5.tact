struct NestedDeepA {
    x: Int;
    y: Int?;
}

struct NestedDeepB {
    a: Bool;
    b: NestedDeepA?;
}

struct NestedDeepC {
    val: NestedDeepB?;
}

contract TestNestedOptionalChain {
    data: NestedDeepC;

    init() {
        self.data = NestedDeepC{
            val: null
        };
    }
}