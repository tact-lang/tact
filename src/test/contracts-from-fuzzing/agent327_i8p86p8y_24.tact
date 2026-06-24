struct Deep {
    val: Int;
}
struct Mid {
    deep: Deep;
}
struct Outer {
    mid: Mid;
}

contract DeepOptTest {
    outer: Outer?;
    init() {
        self.outer = Outer{
            mid: Mid{
                deep: Deep{ val: 123 }
            }
        };
    }
}