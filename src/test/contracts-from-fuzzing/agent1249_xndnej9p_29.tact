struct C {
    val: Int?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract ManyNullableNesting {
    deeplyOpt: A?;

    init() {
        self.deeplyOpt = null;
    }
}