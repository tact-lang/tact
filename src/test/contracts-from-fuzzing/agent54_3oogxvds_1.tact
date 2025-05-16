struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    i: Int;
    inner: Inner;
    option_inner: Inner?;
    map_field: map<Int, Inner>;
}

contract Test {
    state: Outer;
    init() {
        self.state = Outer{
            i: 1,
            inner: Inner{a: 2, b: null},
            option_inner: null,
            map_field: emptyMap(),
        };
    }
}