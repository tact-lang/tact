struct InnerMost { a: Int; b: Bool }
struct Middle { inner: InnerMost; c: Bool }
struct Outer { middle: Middle; d: Int }

contract NestedFields {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    a: 123,
                    b: false,
                },
                c: true,
            },
            d: 456
        };
    }
}