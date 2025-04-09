struct Inner {
    val: Int? = 10;
}

struct Contains {
    inner: Inner;
    label: String;
}

contract MixedDefaults {
    a: Contains;
    b: Contains;

    init() {
        self.a = Contains{ inner: Inner{}, label: "first" };
        self.b = Contains{ inner: Inner{ val: 77 }, label: "second" };
    }
}