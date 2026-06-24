struct SubInner {
    flag: Bool?;
}

struct Outer {
    nested: SubInner;
}

contract DeepOptionalTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            nested: SubInner{
                flag: true
            }
        };
    }
}
