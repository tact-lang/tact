struct MultiLevel {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct Wrapper {
    m: MultiLevel;
    x: Int;
    s: String;
    b: Bool;
}

contract StructInStructs {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            m: MultiLevel{inner1:1, inner2:true, inner3:"hi"},
            x: 7,
            s: "hello",
            b: false
        };
    }
}