struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Bool;
}
struct Wrapper {
    first: Inner1;
    second: Inner2;
}

contract TestContract {
    nestedStructs: Wrapper;

    init() {
        self.nestedStructs = Wrapper{
            first: Inner1{ x: 100 },
            second: Inner2{ y: true },
        };
    }
}