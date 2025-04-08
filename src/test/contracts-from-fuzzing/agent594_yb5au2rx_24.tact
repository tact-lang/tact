message(42) MessageA {}
message(43) MessageB {}

struct Container {
    a: MessageA;
    b: MessageB;
}

contract MessageContainer {
    c: Container = Container{
        a: MessageA{},
        b: MessageB{}
    };
}