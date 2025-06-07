struct Outer {
    x: Int;
    s: String;
}

contract InitPartial {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: 77,
            s: "abc"
        };
    }
}