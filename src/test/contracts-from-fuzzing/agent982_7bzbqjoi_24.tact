struct LargeNesting {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
    five: Int;
    six: Int;
    seven: Int;
    eight: Int;
    nine: Int;
    ten: Int;
}

struct Wrap1 { nest: LargeNesting; }
struct Wrap2 { wrap1: Wrap1; }
struct Wrap3 { wrap2: Wrap2; }
struct Wrap4 { wrap3: Wrap3; }

contract ManyDeepWraps {
    data: Wrap4;

    init() {
        self.data = Wrap4{
            wrap3: Wrap3{
                wrap2: Wrap2{
                    wrap1: Wrap1{
                        nest: LargeNesting{
                            one:1,two:2,three:3,four:4,five:5,
                            six:6,seven:7,eight:8,nine:9,ten:10
                        }
                    }
                }
            }
        };
    }
}