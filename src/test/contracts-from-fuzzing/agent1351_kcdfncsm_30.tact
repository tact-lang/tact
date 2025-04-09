struct Wrap1 { val: Int }
struct Wrap2 { wrap: Wrap1 }
struct Wrap3 { wrap: Wrap2 }
struct Wrap4 { wrap: Wrap3 }
struct Wrap5 { wrap: Wrap4 }

contract Level5Nest {
    field: Wrap5;

    init() {
        self.field = Wrap5{
            wrap: Wrap4{
                wrap: Wrap3{
                    wrap: Wrap2{
                        wrap: Wrap1{ val: 123456 }
                    }
                }
            }
        };
    }
}