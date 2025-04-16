struct Payload1 { a:Int }
struct Payload2 { b:Int }
struct Payload3 { c:Int }

contract MultiPayloads {
    p1: Payload1;
    p2: Payload2;
    p3: Payload3;

    init() {
        self.p1 = Payload1{ a: 1 };
        self.p2 = Payload2{ b: 2 };
        self.p3 = Payload3{ c: 3 };
    }
}