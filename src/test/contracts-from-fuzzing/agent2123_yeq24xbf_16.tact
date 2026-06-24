struct Coordinates {
    x: Int;
    y: Int;
}

struct PointWithLabel {
    label: String;
    point: Coordinates;
}

contract StructComposition {
    data: PointWithLabel;

    init() {
        self.data = PointWithLabel{
            label: "label",
            point: Coordinates{
                x: 5,
                y: 10
            }
        };
    }
}