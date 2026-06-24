struct DeepInner {
    val: Int?;
}

struct Middle {
    deep: DeepInner;
}

struct Outer {
    middle: Middle;
}

contract DeepOptTest {
    field: Outer = Outer{middle: Middle{deep: DeepInner{val: null}}};
}