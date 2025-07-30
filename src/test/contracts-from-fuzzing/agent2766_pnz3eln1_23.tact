struct Sub {
    x: Int;
}

struct Super {
    a: Int;
    b: Sub;
    c: Int;
}

contract EmbeddedStructContract {
    data: Super;

    init() {
        self.data = Super{
            a:1,b:Sub{x:5},c:9
        };
    }
}