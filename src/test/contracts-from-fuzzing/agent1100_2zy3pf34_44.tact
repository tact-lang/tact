struct A {
    x: Int?;
}

struct B {
    y: A?;
}

contract NestedNullableStructs {
    val: B;

    init() {
        self.val = B{ y: null };
    }
}
