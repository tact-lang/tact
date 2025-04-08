struct Deep {
    a: Int;
    b: Int;
}

struct Wrapper {
    first: Int?;
    second: Deep?;
    third: Int?;
    fourth: Deep?;
}

contract ManyOptionals {
    data: Wrapper?;

    init() {
        self.data = null;
    }
}