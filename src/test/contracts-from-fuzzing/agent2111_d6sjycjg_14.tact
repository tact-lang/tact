// contract uses a struct deeply nesting structs, ending in string fields
struct InnerMost {
    label: String;
}

struct Middle2 {
    info: InnerMost;
}

struct Middle1 {
    mid: Middle2;
}

contract LongNestString {
    data: Middle1;

    init() {
        self.data = Middle1{
            mid: Middle2{
                info: InnerMost{
                    label: "Deep"
                }
            }
        };
    }
}