struct ZeroDefaults {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;
}

contract ZeroDefaultsContract {
    data: ZeroDefaults;

    init() {
        self.data = ZeroDefaults{
            a:1,
            b:2,
            c:3
        };
    }
}