struct Innermost { v: Int; }
struct Middle { inner: Innermost; extra: Int; }
struct Outer { m: Middle; x: Int; y: Int; }

contract Test {
    v: Outer? = null;

    init() {
        self.v = Outer{
            m: Middle{
                inner: Innermost{ v: 10 },
                extra: 20
            },
            x:30, y:40
        };
    }

    receive() {}
}