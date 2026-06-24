struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract StructInStructStorage {
    data: Outer;

    init() {
        self.data = Outer{ inner: Nested{ x:1, y:true }, flag:false };
    }
}