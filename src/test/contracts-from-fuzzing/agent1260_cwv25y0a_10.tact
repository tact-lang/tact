struct LargeStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
    k: Int = 11;
    l: Int = 12;
    m: Int = 13;
    n: Int = 14;
    o: Int = 15;
}

contract LargeStructContract {
    data: LargeStruct = LargeStruct{};

    init() {
        self.data = LargeStruct{
            a: 10,
            b: 20,
            c: 30,
            d: 40,
            e: 50,
            f: 60,
            g: 70,
            h: 80,
            i: 90,
            j: 100,
            k: 110,
            l: 120,
            m: 130,
            n: 140,
            o: 150
        };
    }
}