struct StructWithOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestContract {
    data: StructWithOptionals;

    init() {
        self.data = StructWithOptionals{
            x: null,
            y: true,
            s: "hi"
        };
    }
}