struct LargeFlat {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool; f: Bool;
    g: String; h: String;
    i: Int; j: Int;
}

contract FlatTest {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            a:1, b:2, c:3,
            d:true, e:false, f:true,
            g:"hello", h:"world",
            i:4, j:5
        };
    }

    receive() {}
}