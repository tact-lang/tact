struct Wrapped {
    inner: Int; 
    text: String;
}

struct OptionalNested {
    wr1: Wrapped?;
    wr2: Wrapped?;
    wr3: Wrapped?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            wr1: null,
            wr2: null,
            wr3: null,
        };
    }

    receive() {
        let _ = self.data.wr1;
    }
}