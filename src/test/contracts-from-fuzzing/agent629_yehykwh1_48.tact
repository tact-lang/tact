// message struct for nesting
message(1) M1 { a: Int }
message(2) M2 { m: M1 }

contract Test {
    m: M2;
    init() {
        self.m = M2{ m: M1{a:42} };
    }
}
