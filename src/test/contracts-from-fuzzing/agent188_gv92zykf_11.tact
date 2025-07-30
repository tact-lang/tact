struct Param1 { a: Int }
struct Param2 { b: Bool }
struct Param3 { c: String }
struct Param4 { d: Address }
struct Param5 { e: Cell }

struct Container {
    p1: Param1;
    p2: Param2;
    p3: Param3;
    p4: Param4;
    p5: Param5;
}

contract Nesting {
    data: Container;
    init() {
        self.data = Container {
            p1: Param1{ a: 1 },
            p2: Param2{ b: true },
            p3: Param3{ c: "hi" },
            p4: Param4{ d: myAddress() },
            p5: Param5{ e: emptyCell() },
        };
    }
}
