struct Inner {
    note: String;
    counter: Int?;
    active: Bool?;    
}

contract Test {
    innerState: Inner;

    init() {
        self.innerState = Inner{
            note: "testing",
            counter: null,
            active: true
        };
    }

    receive() {}
}