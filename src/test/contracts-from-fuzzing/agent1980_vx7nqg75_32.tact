struct NestInner {
    x: Int?;
    y: String?;
}

struct Nester {
    a: Int;
    b: NestInner;
    c: Bool?;
}

contract CombinationTest {
    data: Nester;

    init() {
        self.data = Nester{
            a: 100,
            b: NestInner{ x: null, y: null },
            c: null
        };
    }
}