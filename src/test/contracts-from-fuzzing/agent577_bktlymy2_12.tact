struct A1 { x: Int }
struct A2 { x: Int }
struct A3 { x: Int }
struct A4 { x: Int }
struct A5 { x: Int }
struct A6 { x: Int }
struct A7 { x: Int }
struct A8 { x: Int }
struct A9 { x: Int }
struct A10 { x: Int }

struct Mega {
    a1: A1;
    a2: A2;
    a3: A3;
    a4: A4;
    a5: A5;
    a6: A6;
    a7: A7;
    a8: A8;
    a9: A9;
    a10: A10;
}

contract BigEmbedded {
    mega: Mega;

    init() {
        self.mega = Mega{
            a1: A1{ x: 1 },
            a2: A2{ x: 2 },
            a3: A3{ x: 3 },
            a4: A4{ x: 4 },
            a5: A5{ x: 5 },
            a6: A6{ x: 6 },
            a7: A7{ x: 7 },
            a8: A8{ x: 8 },
            a9: A9{ x: 9 },
            a10: A10{ x: 10 }
        };
    }
}
