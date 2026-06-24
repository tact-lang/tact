// Optional builtin type inside struct
struct CellOptTest {
    c: Cell?;
}

contract Test {
    receive() {
        let ct: CellOptTest = CellOptTest { c: null };
    }
}