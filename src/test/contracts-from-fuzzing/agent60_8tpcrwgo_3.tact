struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    mapVal: map<Int, Inner>;
}

contract MapStruct {
    state: Outer;

    init() {
        self.state = Outer{
            mapVal: emptyMap(),
        };
    }
}