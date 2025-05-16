struct Compose1 { a: Int; }
struct Compose2 { b: Compose1; }
struct Compose3 { c: Compose2; }
struct Compose4 { d: Compose3; }

contract ComposeLong {
    root: Compose4;

    init() {
        self.root = Compose4{
            d: Compose3{
                c: Compose2{
                    b: Compose1{ a: 123 }
                }
            }
        };
    }
}