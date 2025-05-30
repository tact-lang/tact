struct Mixed {
    a: Int? as uint32;
    b: Bool?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: null,
            b: false,
        };
    }

    receive() {}
}