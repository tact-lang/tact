struct Mixed {
    a: Int = 42;
    b: Bool?;
    c: String;
    d: Bool = false;
}

contract TestContract {
    value: Mixed;

    init() {
        self.value = Mixed{
            c: "hello"
        };
    }
}
