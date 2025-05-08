struct Inner1 { x: Int; }
struct Inner2 { y: Bool; inner1: Inner1; }
struct Inner3 { z: String; inner2: Inner2; }

contract TestContract {
    data: Inner3;

    init() {
        self.data = Inner3{
            z: "hello",
            inner2: Inner2{
                y: true,
                inner1: Inner1{ x: 42 },
            },
        };
    }
}
