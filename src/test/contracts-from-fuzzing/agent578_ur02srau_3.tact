struct LargeStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int?;
    e: Bool = false;
    f: String = "f";
    g: Int = 7;
    h: Bool?;
    i: String = "i";
    j: Int = 10;
    k: Bool = true;
    l: String = "l";
    m: Int = 13;
}

contract LargeStructTest {
    data: LargeStruct;
    
    init() {
        self.data = LargeStruct{
            a: 100,
            b: false,
            c: "hello",
            d: 200,
            e: true,
            f: "world",
            g: 300,
            h: false,
            i: "!",
            j: 400,
            k: false,
            l: "end",
            m: 500
        };
    }
}