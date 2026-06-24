struct S1 {
    x: Int;
    y: Int?;
    z: Bool?;
}

contract ManyOptionals {
    f: S1;
    init() {
        self.f = S1{
            x: 1,
            y: null,
            z: true
        };
    }
}