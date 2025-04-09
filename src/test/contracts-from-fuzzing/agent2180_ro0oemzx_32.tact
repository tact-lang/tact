struct Test {
    a: Int = 0;
    b: Bool;
}

contract DefaultsPartial {
    data: Test;

    init() {
        self.data = Test{
            b: true
        };
    }
}