struct Part {
    foo: Int = 7;
    bar: String?;
}

struct Whole {
    id: Int = 1;
    part: Part?;
}

contract PartialOverrides {
    thing: Whole;

    init() {
        self.thing = Whole{
            // use default 1 for id
            part: Part{
               foo: 17,
               bar: null
            }
        };
    }

    receive() {
        let _ = self.thing;
    }
}