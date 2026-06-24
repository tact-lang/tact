struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}
struct OuterMulti {
    x: Inner1;
    y: Inner2;
    z: Int;
}

contract MultiNestedContract {
    data: OuterMulti;

    init() {
        self.data = OuterMulti{
            x: Inner1{ a: 1 },
            y: Inner2{ b: true },
            z: 77,
        };
    }
}