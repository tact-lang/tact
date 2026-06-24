struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: NestedOptional?;
}

struct NestedOptional {
    m: Int;
    n: Bool?;
}

contract TestContract {
    optNest: OptionalNested = OptionalNested{
        x: null,
        y: true,
        z: NestedOptional{
            m: 123,
            n: null
        }
    };

    receive() {
    }
}