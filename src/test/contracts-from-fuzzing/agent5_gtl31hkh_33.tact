// struct with bool
struct BoolTest {
    b: Bool;
}

contract Test {
    receive() {
        let s: BoolTest = BoolTest { b: true };
    }
}