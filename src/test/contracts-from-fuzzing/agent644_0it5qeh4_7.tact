struct Mid { b: Int; c: Bool?; d: String; }

struct Top { a: Int; inner: Mid; e: String?; }

contract Test {
    data: Top;

    init() {
        self.data = Top{
            a: 77,
            inner: Mid{b:42,c:true,d:"hi"},
            e: "bye"
        };
    }
}