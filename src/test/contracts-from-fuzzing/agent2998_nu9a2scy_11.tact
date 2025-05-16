struct A {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

struct B {
    val1: Int;
    val2: A?;
}

contract OptNestedMultiContract {
    val: B;

    init() {
        self.val = B{
            val1: 55,
            val2: null,
        };
    }
}