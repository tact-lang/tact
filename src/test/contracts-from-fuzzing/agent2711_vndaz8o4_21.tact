struct ManyDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Int = 5;
    g: Int = 6;
    h: Int = 7;
}

contract ComplexDefaults {
    x: ManyDefaults;

    init() {
        self.x = ManyDefaults{
            a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,
        };
    }
}