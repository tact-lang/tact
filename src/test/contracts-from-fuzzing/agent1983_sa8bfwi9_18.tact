struct OptContainers {
    a: Address?;
    c: Cell?;
    s: Slice?;
    t: String?;
}

contract ManyOptContainers {
    data: OptContainers;

    init() {
        self.data = OptContainers{
            a: null,
            c: null,
            s: null,
            t: null
        };
    }
}