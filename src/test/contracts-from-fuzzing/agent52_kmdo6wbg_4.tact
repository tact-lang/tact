contract UnaryNotTest {
    receive() {
        let a: Bool = !true;
        dump(a);
    }
}
