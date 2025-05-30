struct NestedDeeper {
    foo: Int;
    child: NestedDeeper2;
}

struct NestedDeeper2 {
    bar: Int;
    child2: NestedDeeper3;
}

struct NestedDeeper3 {
    baz: Int;
    opt: Bool?;
}

contract DeepTest {
    s: NestedDeeper;

    init() {
        self.s = NestedDeeper{
            foo: 1,
            child: NestedDeeper2{
                bar: 2,
                child2: NestedDeeper3{
                    baz: 3,
                    opt: true
                }
            }
        };
    }
}