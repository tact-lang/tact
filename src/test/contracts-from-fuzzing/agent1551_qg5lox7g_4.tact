struct A {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
    f7: Int?;
    f8: Int?;
    f9: Int?;
    f10: Int?;
}

contract ManyOptionals {
    data: A;

    init() {
        self.data = A{
            f1: null,
            f2: 2,
            f3: null,
            f4: 4,
            f5: null,
            f6: 6,
            f7: null,
            f8: 8,
            f9: null,
            f10: 10,
        };
    }
}