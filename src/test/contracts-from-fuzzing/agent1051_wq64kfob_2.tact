struct MultiBoolTest {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract TestContract {
    sfield: MultiBoolTest;

    init() {
        self.sfield = MultiBoolTest{
            a: true, b: false, c: true, d: false,
            e: true, f: false, g: true, h: false
        };
    }
}