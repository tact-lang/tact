struct ExplicitDefault {
    a: Int = 1;
    b: Bool = false;
}

contract StructDefaultField {
    data: ExplicitDefault;

    init() {
        self.data = ExplicitDefault{
            a: 100,
            b: true
        };
    }
}
