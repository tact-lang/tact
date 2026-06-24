// more deeply nested structs with optional nested and primitive fields
struct Bottom { foo: Int; bar: Bool; }
struct Middle1 { nest: Bottom?; extra: Int; }
struct Middle2 { m1: Middle1?; flag: Bool; }
struct Top { mid2: Middle2?; str: String; }

contract TestContract {
    val: Top;
    init() {
        self.val = Top { mid2: null, str: "hello" };
    }
}