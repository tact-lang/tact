struct A { x: Int; y: Int?; }
struct B { inside: A; text: String; flag: Bool?; }
struct C { b: B; xx: Int; }

contract TestContract {
    data: C;

    init() {
        self.data = C{
            b: B{
                inside: A{x: 1, y: null},
                text: "fuzz",
                flag: true
            },
            xx: 999
        };
    }
}