struct Foo {
    x: Int = 1;
    y: Bool?; // optional bool, default null
    z: String = "abc";
}

contract TestContract {
    data: Foo = Foo{};

    init() {
        self.data = Foo{x: 42, y: true, z: "hello"};
    }

    receive() {
        let _ = self.data.x;
        let _ = self.data.y;
        let _ = self.data.z;
    }
}