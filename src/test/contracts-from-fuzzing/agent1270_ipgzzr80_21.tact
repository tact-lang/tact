trait A { x: Int }
trait B { y: Bool }

contract AB with A, B {
    x: Int;
    y: Bool;

    init() {
        self.x = 1;
        self.y = true;
    }
}