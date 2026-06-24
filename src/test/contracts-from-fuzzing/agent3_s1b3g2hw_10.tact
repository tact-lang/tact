message Empty {}

message NonEmpty {
    x: Int;
}

struct Container {
    a: Empty;
    b: NonEmpty;
}

contract Test {
    receive() {
        let c: Container = Container{a: Empty{}, b: NonEmpty{x:5}};
    }
}