struct SomeData {
    n: Int;
    s: String;
}

contract ManyStructFields {
    a: SomeData;
    b: SomeData;
    c: SomeData;
    d: SomeData;
    e: SomeData;

    init() {
        self.a = SomeData{ n:1, s:"a" };
        self.b = SomeData{ n:2, s:"b" };
        self.c = SomeData{ n:3, s:"c" };
        self.d = SomeData{ n:4, s:"d" };
        self.e = SomeData{ n:5, s:"e" };
    }
}