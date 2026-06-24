struct A { x: Int?; y: String; }
struct B { a: A; flag: Bool; }

contract DeepOpt {
    data: B;
    init() {
        self.data = B{
            a: A{
                x: null,
                y: "test",
            },
            flag: true,
        };
    }
    receive() {}
}