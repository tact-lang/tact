struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: String; }

struct MultiNested {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract MultiNestedFields {
    data: MultiNested;
    init() {
        self.data = MultiNested{
            f1: Inner1{ x: 1 },
            f2: Inner2{ y: true },
            f3: Inner3{ z: "test" }
        };
    }
}