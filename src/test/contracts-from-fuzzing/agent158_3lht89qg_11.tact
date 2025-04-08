struct Ser1 { a: Int as uint32; b: Int as uint64; }
struct Ser2 { prev: Ser1; c: Bool; }

contract SerializationNesting {
    data: Ser2;
    init() {
        self.data = Ser2{
            prev: Ser1{ a:10, b:20 },
            c: true
        };
    }
}