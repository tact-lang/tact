struct Deep2 { f: Int; }
struct Deep1 { d: Deep2; b: Bool?; }
struct Deep0 { d: Deep1; s: String; }

contract TestContract {
    val: Deep0;

    init() {
        self.val = Deep0{
            d: Deep1{d: Deep2{f: 7}, b: null},
            s: "foo"
        };
    }
}