struct BigDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
}

contract DefaultsOverride {
    data: BigDefaults;

    init() {
        self.data = BigDefaults{
            a: 100,
            b: 200,
            c: 300,
            d: 400,
            e: 500
        };
    }
}