struct A { val: Int?; }
struct B { a: A; flag: Bool; }
struct C { b: B?; s: String; }
struct D { c: C; enabled: Bool?; }
contract TestContract {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: B{
                    a: A{ val: null }, flag: true
                },
                s: "ok"
            },
            enabled: false
        };
    }
}