struct Compose1 { a: Int; b: Int }
struct Compose2 { c: Compose1; d: Int }
struct Compose3 { e: Compose2; f: Int }
struct Compose4 { g: Compose3; h: Int }

contract NestedCompose {
    state: Compose4;
    init() {
        self.state = Compose4{
            g: Compose3{
                e: Compose2{
                    c: Compose1{a:11,b:22},
                    d:33
                },
                f:44
            },
            h:55
        };
    }
}