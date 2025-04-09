struct LayerOne { a: Int; }
struct LayerTwo { b: LayerOne; }
struct LayerThree { c: LayerTwo; }
struct LayerFour { d: LayerThree; }
struct LayerFive { e: LayerFour; }

contract FiveLayers {
    field: LayerFive;

    init() {
        self.field = LayerFive{
            e: LayerFour{
                d: LayerThree{
                    c: LayerTwo{
                        b: LayerOne{ a: 123 }
                    }
                }
            }
        };
    }
}