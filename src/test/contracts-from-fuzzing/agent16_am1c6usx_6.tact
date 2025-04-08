// Mix opt and default in nested struct
struct Mix {
    x: Int = 5;
    y: String?;
    z: Bool = true;
}

contract MixDefaults {
    field: Mix;

    init() {
        self.field = Mix{
            y: null,
        };
    }
}
