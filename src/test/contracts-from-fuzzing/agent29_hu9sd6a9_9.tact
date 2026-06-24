struct Inner {
    val: Int;
}
struct Middle {
    nested: Inner;
}
struct Outer {
    nested: Middle;
}

contract DeepThreeLevel {
    value: Outer;

    init() {
        self.value = Outer{
            nested: Middle{
                nested: Inner{
                    val: 123
                }
            }
        };
    }
}