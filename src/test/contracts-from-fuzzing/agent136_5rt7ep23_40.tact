struct OptionalLevels {
    inner: Int?;
}

struct OuterOptional {
    wrap: OptionalLevels?;
}

contract ManyOptionals {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{
            wrap: OptionalLevels{ inner: null }
        };
    }
}