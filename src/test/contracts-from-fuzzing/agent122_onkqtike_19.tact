struct O1 { x: Int?; }
struct O2 { y: Int?; }
struct Container {
    o1: O1?;
    o2: O2?;
}

contract OptComposed {
    data: Container;

    init() {
        self.data = Container{ o1: null, o2: null };
    }
}
