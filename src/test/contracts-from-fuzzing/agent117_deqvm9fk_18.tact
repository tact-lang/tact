struct Named {
    val: Int;
}

contract MixOptionNested {
    a: Int?;
    b: Named?;

    init() {
        self.a = 100;
        self.b = Named{val: 5};
    }
}
