struct Weird {
    a: Int as uint3;
    b: Int as uint5;
    c: Int as int7;
    d: Bool;
    e: Int?;
}

contract TestContract {
    data: Weird;

    init() {
        self.data = Weird{
            a: 3,
            b: 7,
            c: -33,
            d: true,
            e: null
        };
    }

    receive() {
        let _ = self.data.c;
    }
}