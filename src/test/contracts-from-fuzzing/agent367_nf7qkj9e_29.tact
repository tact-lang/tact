struct StructA { num: Int }
struct StructB { sa: StructA }
struct StructC { sb: StructB }
struct StructD { sc: StructC }

contract Tower {
    d: StructD;

    init() {
        self.d = StructD{
            sc: StructC{
                sb: StructB{
                    sa: StructA{
                        num: 42
                    }
                }
            }
        };
    }
}