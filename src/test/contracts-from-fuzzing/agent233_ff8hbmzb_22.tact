struct S { x: Int? = null; }

contract StructNullAssign {
    data: S;

    init() {
        self.data = S{x: 5};
    }

    receive() {
        let _ = self.data.x;
    }
}