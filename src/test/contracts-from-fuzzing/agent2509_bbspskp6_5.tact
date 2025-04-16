struct Nested1 { a: Int; opt: Int?; }
struct Nested2 { n: Nested1; flag: Bool; }
struct Nested3 { d: Nested2; val: Int?; }

contract Depth3 {
    dep: Nested3;

    init() {
        self.dep = Nested3{
            d: Nested2{
                n: Nested1{ a: 1, opt: null },
                flag: true
            },
            val: null
        };
    }
}