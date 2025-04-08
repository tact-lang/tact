struct BoolDeep1 { flag: Bool; }
struct BoolDeep2 { nested: BoolDeep1; }
struct BoolDeep3 { nested: BoolDeep2; }
struct BoolDeep4 { nested: BoolDeep3; }
struct BoolDeep5 { nested: BoolDeep4; }

contract BoolNesting {
    data: BoolDeep5;

    init() {
        self.data = BoolDeep5{
            nested: BoolDeep4{
                nested: BoolDeep3{
                    nested: BoolDeep2{
                        nested: BoolDeep1{
                            flag: true
                        }
                    }
                }
            }
        };
    }
}