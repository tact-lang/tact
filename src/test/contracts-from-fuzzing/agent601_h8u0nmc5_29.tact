// Deep nesting with both optional and concrete nested structs
struct Zed {
    z: Int;
}
struct Why {
    y: Zed?;
}
struct Ex {
    x: Why;
}

contract DeepOptionals {
    foo: Ex;

    init() {
        self.foo = Ex{
            x: Why{
                y: null
            }
        };
    }
}
