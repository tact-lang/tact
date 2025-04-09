struct Composite {
    inner1: Bool;
    inner2: Address;
    inner3: Slice?;
    inner4: String;
}

contract CompositeFields {
    val1: Composite;
    val2: Composite;

    init() {
        self.val1 = Composite{
            inner1: true,
            inner2: myAddress(),
            inner3: null,
            inner4: "hi"
        };
        self.val2 = Composite{
            inner1: false,
            inner2: myAddress(),
            inner3: null,
            inner4: "bye"
        };
    }
}