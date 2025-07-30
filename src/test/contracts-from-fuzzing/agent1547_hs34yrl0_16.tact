struct Outer {
    nested: Nested;
}

struct Nested {
    deep: Deep;
}

struct Deep {
    val1: Int;
    val2: Int;
}

contract ArrangeTest {
    o: Outer;

    init() {
        self.o = Outer{
            nested: Nested{
                deep: Deep{
                    val1: 123,
                    val2: 456
                }
            }
        };
    }
}