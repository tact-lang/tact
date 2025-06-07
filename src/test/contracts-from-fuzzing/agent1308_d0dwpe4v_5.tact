struct OptNest {
    foo: Int;
    label: String?;
    flag: Bool;
}

contract OptStructField {
    data: OptNest?;

    init() {
        self.data = OptNest{
            foo: 1,
            label: null,
            flag: true
        };
    }
}