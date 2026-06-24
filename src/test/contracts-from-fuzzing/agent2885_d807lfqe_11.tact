struct A { x: Int }
struct B { y: Int }

contract OptionalSwap {
    left: A?;
    right: B?;

    init() {
        self.left = null;
        self.right = B{y:10};
    }
}