struct Container {
    opt: Int?;
}

contract DefValTest {
    val: Container;

    init() {
        self.val = Container{ opt: null };
    }
}