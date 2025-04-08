struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; opt: Int?; }
struct D { c: C; flag: Bool; text: String; }
struct E { d: D; num: Int; }

contract ComboNesting {
    data: E;

    init() {
        self.data = E{
            d: D{
                c: C{
                    a: A{ x: 1 },
                    b: B{ y: 2 },
                    opt: null
                },
                flag: true,
                text: "hi"
            },
            num: 99
        };
    }
}