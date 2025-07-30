struct A {
    a: Int;
}

struct B {
    b: Bool;
}

struct UnionStruct {
    case1: A?;
    case2: B?;
}

contract VariantTest {
    data: UnionStruct;
    init() {
        self.data = UnionStruct{
            case1: null,
            case2: B{b: true}
        };
    }
}