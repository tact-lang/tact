struct Booleans {
    f: Bool = false;
    t: Bool = true;
    o: Bool?;
}

contract BoolTest {
    bs: Booleans;

    init() {
        self.bs = Booleans{
            f: false,
            t: true,
            o: true
        };
    }
}