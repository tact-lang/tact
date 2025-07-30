struct WeirdWidths {
    a: Int? as uint3;
    b: Int? as int5;
    c: Int? as uint7;
}

contract TestContract {
    tiny: WeirdWidths;

    init() {
        self.tiny = WeirdWidths{
            a: 5,
            b: -7,
            c: 50
        };
    }
}