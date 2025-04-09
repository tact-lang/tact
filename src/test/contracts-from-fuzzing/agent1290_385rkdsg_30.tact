// Composition of many nested structs with many optional inner fields
struct SS1 { a: Int?; b: String?; }
struct SS2 { x: SS1?; y: SS1?; }
struct SS3 { m: SS2?; n: SS2?; }

contract TestContract {
    complex: SS3;

    init() {
        self.complex = SS3{
            m: null,
            n: null
        };
    }

    receive() {
        self.complex = SS3{
            m: SS2{ x: SS1{ a: 1, b: "a" }, y: SS1{ a: 2, b: "b" } },
            n: SS2{ x: SS1{ a: 3, b: "c" }, y: SS1{ a: 4, b: "d" } }
        };
    }
}