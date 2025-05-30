struct TailOptional {
    x: Int;
    y: Int?;
}

contract TailOptionTest {
    data: TailOptional;

    init() {
        self.data = TailOptional{
            x: 5,
            y: null
        };
    }
}