struct StructOne { val: Int; }
struct StructTwo { so: StructOne; }
struct StructThree { st: StructTwo; }
struct StructFour { sf: StructThree; }

contract VeryDeep {
    deepField: StructFour;

    init() {
        self.deepField = StructFour{
            sf: StructThree{
                st: StructTwo{
                    so: StructOne{ val: 123 }
                }
            }
        };
    }
}