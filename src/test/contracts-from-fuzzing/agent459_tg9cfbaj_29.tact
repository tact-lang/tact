struct Elem { x: Int; y: Bool }

struct Bundle {
    e1: Elem;
    e2: Elem;
    e3: Elem;
}

contract ManyNested {
    data: Bundle = Bundle{
        e1: Elem{ x:1,y:true },
        e2: Elem{ x:2,y:false },
        e3: Elem{ x:3,y:true }
    };

    init() {
        self.data = Bundle{
            e1: Elem{ x:4,y:false },
            e2: Elem{ x:5,y:true },
            e3: Elem{ x:6,y:false }
        };
    }
}