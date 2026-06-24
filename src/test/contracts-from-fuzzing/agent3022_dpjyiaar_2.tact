struct Inner { a: Int; b: Int; }
struct Middle { inn: Inner; c: Int; }
struct Outer { mid: Middle; d: Int; }

contract TestNested {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                inn: Inner{a: 11, b: 22},
                c: 33
            },
            d: 44
        };
    }
}
