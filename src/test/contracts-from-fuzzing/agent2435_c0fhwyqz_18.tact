contract CombinedOptionals {
    a: Int?;
    b: StructOpt?;

    init() {
        self.a = null;
        self.b = StructOpt{
            x: 5,
            y: "hello"
        };
    }
}

struct StructOpt {
    x: Int;
    y: String;
}