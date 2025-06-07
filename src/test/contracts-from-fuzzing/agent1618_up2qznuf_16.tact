struct Inner {
    x: Int = 5;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    text: String = "hello";
}

contract DefaultsOmitted {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{}  // omit both fields
        };
    }
}