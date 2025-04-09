struct Opt1 { x: Int?; }
struct Opt2 { x: Opt1?; }
struct Opt3 { x: Opt2?; }

contract Test17 {
    field: Opt3;

    init() {
        self.field = Opt3{
            x: Opt2{
                x: Opt1{
                    x: 123
                }
            }
        };
    }
}