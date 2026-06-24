contract LargeOptionalStruct {
    a: OptionalStruct?;

    init() {
        self.a = OptionalStruct{
            x: 1,
            y: 2,
            z: 3,
            t: 4
        };
    }
}

struct OptionalStruct {
    x: Int;
    y: Int;
    z: Int;
    t: Int;
}
