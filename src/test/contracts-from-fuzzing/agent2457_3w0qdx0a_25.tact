struct A1 { v1: Int; }
struct A2 { v2: A1; }
struct A3 { v3: A2; }
struct A4 { v4: A3; }
struct A5 { v5: A4; }
struct A6 { v6: A5; }

contract Chain6 {
    chain: A6;
    init() {
        self.chain = A6{ v6: A5{ v5: A4{ v4: A3{ v3: A2{ v2: A1{v1: 7}}}}}};
    }
}