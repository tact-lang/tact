struct Composite {
    x: Int;
    y: Int?;
    z: Bool;
    t: String?;
}

contract CompositeInState {
    c: Composite;

    init() {
        self.c = Composite{
            x: 5,
            y: null,
            z: true,
            t: "hi"
        };
    }

    receive() {}
}