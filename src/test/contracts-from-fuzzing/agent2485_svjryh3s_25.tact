// deeply nested optionals with various primitive types
struct O1 { val: Int?; }
struct O2 { val: Bool?; }
struct O3 { val: String?; }

struct Deep {
    o1: O1?;
    o2: O2?;
    o3: O3?;
}

contract DeepOptionals {
    deep: Deep;

    init() {
        self.deep = Deep{
            o1: null,
            o2: null,
            o3: null
        };
    }
}