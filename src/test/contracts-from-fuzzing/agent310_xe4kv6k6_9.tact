struct Inner {
    x: Int;
    y: Int;
}

struct Holder {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract StructOfStructsTest {
    data: Holder;

    init() {
        self.data = Holder{
            one: Inner{x:1,y:2},
            two: Inner{x:3,y:4},
            three: Inner{x:5,y:6}
        };
    }
}