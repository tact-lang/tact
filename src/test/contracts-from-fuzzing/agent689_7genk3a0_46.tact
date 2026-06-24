struct Compose1 { x: Int }
struct Compose2 { y: Int }
struct Compose3 { a: Compose1; b: Compose2 }

contract CompositeCombination {
    data: Compose3;
    init() {
        self.data = Compose3{
            a: Compose1{ x: 11 },
            b: Compose2{ y: 22 }
        };
    }
}