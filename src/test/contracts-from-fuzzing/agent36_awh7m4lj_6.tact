struct Inner1 { x: Int; y: String }
struct Inner2 { a: Bool; b: Cell }

struct MultipleNested {
    s1: Inner1;
    s2: Inner2;
    z: Int;
}

contract ComplexStorage {
    content: MultipleNested;

    init() {
        self.content = MultipleNested{
            s1: Inner1{x: 11, y: "hey"},
            s2: Inner2{a: false, b: emptyCell()},
            z: 100
        };
    }
}
