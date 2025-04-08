trait T {
    const A: Int = 5;
}

struct RefTrait {
    a: Int;
}

contract UsingTrait with T {
    val: Int;

    init() {
        self.val = self.A;
    }
}
