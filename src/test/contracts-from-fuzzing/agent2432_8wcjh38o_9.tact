struct A {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct B {
    a: A?;
    text: String;
}

contract Test {
    val: B;
    init() {
        self.val = B{ a: null, text: "hi" };
    }
}