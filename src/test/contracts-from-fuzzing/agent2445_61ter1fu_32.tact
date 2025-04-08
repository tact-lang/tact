struct Inner {
    x: Int?;
}

struct Outer {
    inn: Inner?;
}

contract ManyNulls {
    o: Outer?;

    init() {
        self.o = Outer{
            inn: null
        };
    }

    receive() {}
}