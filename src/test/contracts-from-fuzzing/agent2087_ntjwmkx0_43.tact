struct Flatten1 {
    x: Int;
}
struct Flatten2 {
    y: Int;
}

contract MultiFlat {
    a: Flatten1;
    b: Flatten2;

    init() {
        self.a = Flatten1{x:1};
        self.b = Flatten2{y:2};
    }
}