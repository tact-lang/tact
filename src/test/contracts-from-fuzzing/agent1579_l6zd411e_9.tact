struct MultiOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract ManyOptionals {
    field: MultiOptionals;

    init() {
        self.field = MultiOptionals{
            i: null,
            b: null,
            s: null
        };
    }

    receive() {
        self.field.i = 10;
        self.field.b = true;
        self.field.s = "hello";
    }
}