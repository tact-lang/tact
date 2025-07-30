struct Container {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

contract NestedDefault {
    data: Container = Container{
        inner1: 5,
        inner2: true,
        inner3: "hello"
    };
}