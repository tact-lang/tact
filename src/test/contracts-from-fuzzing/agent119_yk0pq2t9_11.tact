struct Leaf { data: String?; }

struct Middle { leaf: Leaf; flag: Bool?; }

struct Top { middle: Middle; num: Int; }

contract TestContract {
    store: Top;

    init() {
        self.store = Top{
            middle: Middle{
                leaf: Leaf{ data: null },
                flag: null
            },
            num: 999
        };
    }
}