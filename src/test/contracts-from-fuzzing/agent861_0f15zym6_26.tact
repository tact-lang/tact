struct Point { x: Int; y: Int; }

struct Wrapper {
    val: Point?;
    num: Int;
}

contract OptionalPointWithInt {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            val: null,
            num: 5
        };
    }

    receive() {
        let _ = self.data;
    }
}