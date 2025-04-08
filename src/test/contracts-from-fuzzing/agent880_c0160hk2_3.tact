struct Deep2 { x: Int; y: String; }

struct Deep1 { inner: Deep2; z: Bool; }

contract Nested {
    val: Deep1;

    init() {
        self.val = Deep1{
            inner: Deep2{
                x: 99,
                y: "hello",
            },
            z: true,
        };
    }
}