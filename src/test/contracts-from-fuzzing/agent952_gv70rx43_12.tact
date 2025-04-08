struct OptionalDeep1 { oi: Int?; }
struct OptionalDeep2 { s: OptionalDeep1?; }
struct OptionalDeep3 { s: OptionalDeep2?; }

contract OptionalNested {
    opt: OptionalDeep3;

    init() {
        self.opt = OptionalDeep3{
            s: OptionalDeep2{
                s: OptionalDeep1{
                    oi: null
                }
            }
        };
    }
}
