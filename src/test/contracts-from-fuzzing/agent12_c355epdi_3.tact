contract BoolTest {
    receive() {
        let b1: Bool = true;
        let b2: Bool = false;
        // Test boolean literals and logical operators
        let r: Bool = b1 && (!b2) || false;
        dump(r);
    }
}
