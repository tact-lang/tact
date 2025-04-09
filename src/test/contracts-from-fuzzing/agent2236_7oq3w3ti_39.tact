struct Test1 { foo: Int; }
struct Test2 { bar: String?; }
struct Test3 { baz: Bool; }

contract Composed {
    x: Test1;
    y: Test2;
    z: Test3;

    init() {
        self.x = Test1{ foo: 1 };
        self.y = Test2{ bar: null };
        self.z = Test3{ baz: true };
    }
}