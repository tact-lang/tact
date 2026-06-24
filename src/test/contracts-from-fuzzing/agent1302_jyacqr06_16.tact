struct MultiDefaults {
    a: Int = 7;
    s: String = "foo";
    b: Bool = true;
    c: Int?;
}

contract DefaultsInit {
    data: MultiDefaults;

    init() {
        self.data = MultiDefaults{};
    }

    receive() {
        let a = self.data.a;
        let s = self.data.s;
        let b = self.data.b;
        let c = self.data.c;
    }
}
