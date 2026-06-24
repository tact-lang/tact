struct LongNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

struct MoreNested {
    one: LongNested;
    two: LongNested;
}

contract HugeStruct {
    payload: MoreNested = MoreNested{
        one: LongNested{
            a: 1, b: true, c: "x", d: 2, e: false, f: "y"
        },
        two: LongNested{
            a: 3, b: false, c: "z", d: 4, e: true, f: "w"
        }
    };
    init() {
        self.payload = MoreNested{
            one: LongNested{
                a: 10, b: false, c: "a", d: 20, e: true, f: "b"
            },
            two: LongNested{
                a: 30, b: true, c: "c", d: 40, e: false, f: "d"
            }
        };
    }
}