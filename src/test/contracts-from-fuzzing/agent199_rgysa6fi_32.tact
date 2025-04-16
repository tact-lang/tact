struct A1 { a: Int?; }
struct A2 { s: A1?; }
struct A3 { s: A2?; }

contract MultiLayerNulls {
    data: A3;

    init() {
        self.data = A3{
            s: A2{
                s: null,
            },
        };
    }
}
