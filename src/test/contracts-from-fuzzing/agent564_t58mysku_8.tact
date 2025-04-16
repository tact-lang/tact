// Same as previous, but ensure assignment is via variable, not via optional unwrap chain
struct Point {
    x: Int;
    y: Int;
}

struct Box {
    corner: Point?;
    filled: Bool;
}

contract OptionalsDeepFix {
    state: Box?;

    init() {
        self.state = Box { corner: Point { x: 7, y: 8 }, filled: true };
    }

    receive() {
        let s = self.state!!;
        let p = s.corner!!;
        p.x += 1;
    }
}