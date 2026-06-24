contract OptionalFieldTest {
    point: PointOptionals;

    init() {
        self.point = PointOptionals{
            name: null,
            age: null,
            comment: "ok"
        };
    }
}

struct PointOptionals {
    name: String?;
    age: Int?;
    comment: String;
}