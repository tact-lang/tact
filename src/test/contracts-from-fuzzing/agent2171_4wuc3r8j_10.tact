struct HasDefault {
    foo: Int = 42;
    bar: Bool?;
}

contract DefaultStructField {
    val: HasDefault;

    init() {
        self.val = HasDefault{
            bar: true
        };
    }
}