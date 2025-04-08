struct One { a: Int; }
struct Two { b: Int; c: Int; }
struct Three { d: One; e: Two; f: String; }

contract Test {
    x: One;
    y: Two;
    z: Three;

    init() {
        self.x = One{ a:1 };
        self.y = Two{ b:2, c:3 };
        self.z = Three{
            d: One{ a:4 },
            e: Two{ b:5, c:6 },
            f: "hi"
        };
    }

    receive() {}
}