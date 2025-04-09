struct Level2 {
    a: Int;
    b: Bool;
}
struct Level1 {
    x: Level2;
}
contract NestedOptStructNull {
    data: Level1?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}